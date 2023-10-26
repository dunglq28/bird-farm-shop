/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Public;

import Cart.CartObj;
import Daos.BirdNestDetail_TrackingDAO;
import Daos.Bird_Nest_TrackingDAO;
import Daos.ProductDAO;
import Daos.OrderDAO;
import Daos.OrderDetailDAO;
import Models.AccountDTO;
import Models.BirdNestDetail_TrackingDTO;
import Models.Bird_Nest_TrackingDTO;
import Models.CustomerDTO;
import Models.OrderDTO;
import Models.OrderDetailDTO;
import Models.ProductDTO;
import Object.Products;
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

        String vnPayStatus = request.getParameter("vnp_TransactionStatus");
        String url = MyAppConstants.PublicFeatures.ERROR_PAGE;
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        try {
            String paymentMethod = (String) session.getAttribute("PAYMENT_METHOD");
            CartObj cart = (CartObj) session.getAttribute("BIRD_CART");
            ProductDTO maleBird = (ProductDTO) session.getAttribute("MALE_BIRD_CHOOSE");
            ProductDTO femaleBird = (ProductDTO) session.getAttribute("FEMALE_BIRD_CHOOSE");

            int serviceID = Integer.parseInt((String) session.getAttribute("SERVICE_ID"));

            if (cart == null && maleBird == null && femaleBird == null) {
                url = "cart";
            } else {
                String shippingMethod = (String) session.getAttribute("SHIPPING_METHOD");

                AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
                CustomerDTO customer = (CustomerDTO) session.getAttribute("CUSTOMER");
                int temp = (Integer) session.getAttribute("SHIPPING_CASH");

                float shippingCash = (float) temp;
                String totalOrder = (String) session.getAttribute("TOTAL_ORDER");
                long millis = System.currentTimeMillis();
                java.sql.Date orderDate = new java.sql.Date(millis);

                if (paymentMethod.equals("COD") || paymentMethod.equals("VNPAY") && vnPayStatus.equals("00")) {
                    OrderDAO orderdao = new OrderDAO();
                    String orderID = orderdao.createOrderID();
                    OrderDTO newOrder = new OrderDTO(orderID, serviceID, account.getAccountID(), null, shippingMethod, null, customer.getAddress(), customer.getCity(),
                            orderDate, null, 0, shippingCash, Float.parseFloat(totalOrder), paymentMethod, "Wait for confirmation");
                    orderdao.createOrder(newOrder);

                    ProductDAO birdDao = new ProductDAO();
                    OrderDetailDAO odDao = new OrderDetailDAO();
                    BirdNestDetail_TrackingDAO bndedao = new BirdNestDetail_TrackingDAO();
                    Bird_Nest_TrackingDAO bndao = new Bird_Nest_TrackingDAO();
                    OrderDetailDTO odDto;
                    Bird_Nest_TrackingDTO bndto;
                    int quantityAvaUpdate;
                    int quantitySold;
                    String bnId;
                    String status;
                    switch (serviceID) {
                        case 1:
                            for (String key : cart.getItems().keySet()) {
                                odDto = new OrderDetailDTO(orderID, key,
                                        Float.parseFloat(cart.getItems().get(key).getPriceDiscount()),
                                        cart.getItems().get(key).getQuantityBuy());
                                quantityAvaUpdate = cart.getItems().get(key).getQuantityAvailable() - cart.getItems().get(key).getQuantityBuy();
                                if (quantityAvaUpdate == 0) {
                                    status = "Sold out";
                                } else {
                                    status = "Available";
                                }
                                quantitySold = cart.getItems().get(key).getQuantitySold() + cart.getItems().get(key).getQuantityBuy();
                                birdDao.updateQuantityAfterOrder(quantityAvaUpdate, quantitySold, status, key);
                                odDao.createOrderDetail(odDto);
                            }
                            cart.removeAllBird();
                            session.removeAttribute("BIRD_CART");
                            session.setAttribute("CART_QUANTITY_PRODUCT", cart.getItemsLength());
                            break;
                        case 2:
                            odDto = new OrderDetailDTO(orderID, maleBird.getProductID(), maleBird.getPriceDiscount(), 0);
                            odDao.createOrderDetail(odDto);
                            odDto = new OrderDetailDTO(orderID, femaleBird.getProductID(), femaleBird.getPriceDiscount(), 0);
                            odDao.createOrderDetail(odDto);
                            
                            quantityAvaUpdate = maleBird.getQuantity_Available() - 1;
                            if (quantityAvaUpdate == 0) {
                                status = "Sold out";
                            } else {
                                status = "Available";
                            }
                            birdDao.updateQuantityAfterOrder(quantityAvaUpdate, maleBird.getQuantity_Sold(), status, maleBird.getProductID());
                            birdDao.updateQuantityMating(maleBird.getQuantity_AreMating() + 1, maleBird.getProductID());
                            quantityAvaUpdate = femaleBird.getQuantity_Available() - 1;
                            if (quantityAvaUpdate == 0) {
                                status = "Sold out";
                            } else {
                                status = "Available";
                            }
                            birdDao.updateQuantityAfterOrder(quantityAvaUpdate, femaleBird.getQuantity_Sold(), status, femaleBird.getProductID());
                            birdDao.updateQuantityMating(femaleBird.getQuantity_AreMating() + 1, femaleBird.getProductID());
                            
                            bndao = new Bird_Nest_TrackingDAO();
                            bnId = bndao.createBirdNestID();
                            bndto = new Bird_Nest_TrackingDTO(bnId, orderID, null, 0,
                                    account.getAccountID(), serviceID, Float.parseFloat(totalOrder),
                                    orderDate, orderDate, null, "Wait for confirmation");
                            bndao.createBirdNestTracking(bndto);
                            session.removeAttribute("MALE_BIRD_CHOOSE");
                            session.removeAttribute("FEMALE_BIRD_CHOOSE");
                            break;
                    }
                    session.setAttribute("ORDER_ID", orderID);
                    url = MyAppConstants.PublicFeatures.SUCCESS_ORDER_CONTROLLER;
                }
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
