/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Public;

import Models.AccountDTO;
import Utils.Constants;
import java.io.IOException;
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
        String paymentMethod = request.getParameter("PaymentMethod");
        String serviceID = request.getParameter("txtServiceID");
        String productID = request.getParameter("txtproductID");
        String quantityBuy = request.getParameter("quantity_Buy");
        String orderID = request.getParameter("txtOrderID");
        String url = Constants.PublicFeatures.HANDLE_PAYMENT_CONTROLLER;
        HttpSession session = request.getSession();

        try {
            AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
            if (serviceID != null) {
                session.setAttribute("TOTAL_ORDER", totalOrder);
                session.setAttribute("SERVICE_ID", serviceID);
            }

            session.setAttribute("PRODUCT_ID_SERVICE", productID);
            session.setAttribute("EGG_QUANTITY", quantityBuy);
            request.setAttribute("SHIPPING_METHOD", shippingMethod);
            if (orderID != null) {
                session.setAttribute("OrderIDBirdNest", orderID);
            }

            if (account == null) {
                url = Constants.PublicFeatures.CHECK_LOGIN_CONTROLLER;
            } else if (button == null) {
                url = Constants.PublicFeatures.HANDLE_PAYMENT_CONTROLLER;
            } else if (button.equals("BuyNow") || button.equals("CompletePayment")) {
                url = Constants.PublicFeatures.INFO_RECEIVE_CONTROLLER;
            } else if (button.equals("Continue")) {
                url = Constants.PublicFeatures.INFO_RECEIVE_CONTROLLER;
            } else if (button.equals("Order") && paymentMethod.equals("COD")
                    || button.equals("Booking") && paymentMethod.equals("COD")
                    || button.equals("Pay") && paymentMethod.equals("COD")) {
                session.setAttribute("PAYMENT_METHOD", "COD");
                url = Constants.PublicFeatures.CREATE_ORDER_CONTROLLER;
            } else if (button.equals("Order") && paymentMethod.equals("VNPAY")
                    || button.equals("Booking") && paymentMethod.equals("VNPAY")
                    || button.equals("Pay") && paymentMethod.equals("VNPAY")) {
                session.setAttribute("PAYMENT_METHOD", "VNPAY");
                url = Constants.PublicFeatures.CHECKOUT_VNPAY_CONTROLLER;
            }

//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        } catch (ClassNotFoundException ex) {
//            ex.printStackTrace();
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