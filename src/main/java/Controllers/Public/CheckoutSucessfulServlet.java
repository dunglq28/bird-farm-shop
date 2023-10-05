/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Public;

import Cart.CartObj;
import Daos.BirdDAO;
import Daos.OrderDAO;
import Daos.OrderDetailDAO;
import Models.AccountDTO;
import Models.OrderDTO;
import Models.OrderDetailDTO;
import Utils.MyAppConstants;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
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
@WebServlet(name = "Sucessful", urlPatterns = {"/Sucessful"})
public class CheckoutSucessfulServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String totalOrder = request.getParameter("txtTotalOrder");
        String shippingMethod = request.getParameter("shippingMethod");
        String url = "";
        HttpSession session = request.getSession();

        try {
            CartObj cart = (CartObj) session.getAttribute("BIRD_CART");
            if (cart == null) {
                url = MyAppConstants.CustomerFeatures.MY_ORDER_CONTROLLER;
            } else {
                AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
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
                OrderDetailDAO odDao = new OrderDetailDAO();
                OrderDetailDTO odDto;
                BirdDAO birdDao = new BirdDAO();
                for (String key : cart.getItems().keySet()) {
                    odDto = new OrderDetailDTO(orderID, 1, key, null,
                            cart.getItems().get(key).getPrice(),
                            cart.getItems().get(key).getQuantity_Buy(), "Processing");
//                        int quantityAvaUpdate = cart.getItems().get(key).getQuantity_Available() + cart.getItems().get(key).getQuantity_Buy();
//                        birdDao.updateQuantityAvailable(quantityAvaUpdate, key);
                    odDao.createOrderDetail(odDto);
                }
                cart.removeAllBird();
                session.removeAttribute("BIRD_CART");
                session.setAttribute("CART_QUANTITY_PRODUCT", cart.getItemsLength());
                url = MyAppConstants.CustomerFeatures.MY_ORDER_CONTROLLER;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            response.sendRedirect(url);
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