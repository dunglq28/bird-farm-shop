/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Public;

import Cart.CartObj;
import Daos.BirdDAO;
import Daos.CustomerDAO;
import Daos.OrderDAO;
import Daos.OrderDetailDAO;
import Models.AccountDTO;
import Models.BirdDTO;
import Models.CustomerDTO;
import Models.OrderDTO;
import Models.OrderDetailDTO;
import Utils.MyAppConstants;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hj
 */
@WebServlet(name = "Checkout", urlPatterns = {"/Checkout"})
public class CheckoutServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String button = request.getParameter("btAction");
        String totalOrder = request.getParameter("txtTotalOrder");
        String shippingMethod = request.getParameter("shippingMethod");
        String url = "";
        HttpSession session = request.getSession();

        try {
            AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
            CustomerDAO dao = new CustomerDAO();
            CustomerDTO customer = null;

            if (shippingMethod == null || shippingMethod.equals("Fast delivery")) {
                request.setAttribute("SHIPPING_METHOD", "Fast delivery");
                request.setAttribute("SHIPPING_CASH", 125000);
            } else if (shippingMethod.equals("Receive directly at shop")) {
                LocalDate localDate = LocalDate.now();
                int year = localDate.getYear();
                int month = localDate.getMonthValue();
                int day = localDate.getDayOfMonth();
                request.setAttribute("SHIPPING_METHOD", "Receive directly at shop");
                request.setAttribute("SHIPPING_CASH", 0);
                request.setAttribute("YEAR", year);
                request.setAttribute("MONTH", month);
                request.setAttribute("DAY", day);
            }

            if (account == null) {
                url = "guest?btAction=loginPage";
                session.setAttribute("BACK_CART", "cart");
            } else {
                customer = dao.getCustomerByAccountID(account.getAccountID());
                if (customer.getAddress() == null && customer.getCity() == null && customer.getPhone_Number() == null) {
                    request.setAttribute("FULLNAME", customer.getFullName());
                    url = MyAppConstants.PublicFeatures.RECEIVING_INFO_PAGE;
                } else {
                    url = MyAppConstants.PublicFeatures.PAYMENT_PAGE;
                    request.setAttribute("CUSTOMER", customer);
                    request.setAttribute("TOTAL_ORDER", totalOrder);
                }
            }

            switch (button) {
                case "Continue":
                    String fullName = request.getParameter("txtFullName");
                    String phoneNumber = request.getParameter("txtPhone");
                    String city = request.getParameter("txtCity");
                    String address = request.getParameter("txtAddress");
                    boolean result = dao.updateCustomer(fullName, phoneNumber, address, city, customer.getCustomerID());
                    customer = dao.getCustomerByAccountID(account.getAccountID());
                    request.setAttribute("CUSTOMER", customer);
                    if (result) {
                        url = MyAppConstants.PublicFeatures.PAYMENT_PAGE;
                        request.setAttribute("TOTAL_ORDER", totalOrder);
                    }
                    break;
                case "Order":
                    String paymentMethod = request.getParameter("PaymentMethod");
                    float shippingCash = Float.parseFloat(request.getParameter("txtShippingCash"));
                    long millis = System.currentTimeMillis();
                    java.sql.Date orderDate = new java.sql.Date(millis);
                    Date receiptDay = null;
                    if (shippingMethod.equals("Receive directly at shop")) {
                        String received_Day = request.getParameter("txtDay");
                        String received_Month = request.getParameter("txtMonth");
                        String received_Year = request.getParameter("txtYear");
                        String receiptDayString = received_Year + "-" + received_Month + "-" + received_Day;
                        receiptDay = Date.valueOf(receiptDayString);
                    }
                    OrderDAO orderdao = new OrderDAO();
                    String orderID = orderdao.createOrderID();
                    OrderDTO newOrder = new OrderDTO(orderID, account.getAccountID(), null, shippingMethod, null,
                            orderDate, receiptDay, 0, shippingCash, Float.parseFloat(totalOrder), paymentMethod, "Processing");
                    orderdao.createOrder(newOrder);
                    CartObj cart = (CartObj) session.getAttribute("BIRD_CART");
                    OrderDetailDAO odDao = new OrderDetailDAO();
                    OrderDetailDTO odDto;
                    BirdDAO birdDao = new BirdDAO();
                    for (String key : cart.getItems().keySet()) {
                        odDto = new OrderDetailDTO(orderID, 1, key, null,
                                cart.getItems().get(key).getPrice(),
                                cart.getItems().get(key).getQuantity_Buy(), "Processing");
//                        int quantityAvaUpdate = cart.getItems().get(key).getQuantity_Available() - cart.getItems().get(key).getQuantity_Buy();
//                        birdDao.updateQuantityAvailable(quantityAvaUpdate, key);
                        odDao.createOrderDetail(odDto);
                    }
                    cart.removeAllBird();
                    session.setAttribute("CART_QUANTITY_PRODUCT", cart.getItemsLength());
                    url = MyAppConstants.PublicFeatures.HOME_CONTROLLER;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
