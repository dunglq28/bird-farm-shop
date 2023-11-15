/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Public;

import Daos.CustomerDAO;
import Daos.OrderDAO;
import Daos.OrderDetailDAO;
import Models.AccountDTO;
import Models.CustomerDTO;
import Object.Products;
import Utils.Constants;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(name = "HandlePaymentServlet", urlPatterns = {"/HandlePaymentServlet"})
public class HandlePaymentServlet extends HttpServlet {

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
        String url = Constants.PublicFeatures.PAYMENT_PAGE;
        String button = request.getParameter("btAction");
        HttpSession session = request.getSession();

        try {
            // Take information of customer
            AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
            String serviceID = (String) session.getAttribute("SERVICE_ID");

            CustomerDAO dao = new CustomerDAO();
            CustomerDTO customer = null;
            customer = dao.getCustomerByAccountID(account.getAccountID());

            if (customer.getAddress() == null && customer.getCity() == null && customer.getPhone_Number() == null) {// if there is no recipient information
                request.setAttribute("FULLNAME", customer.getFullName());
                url = Constants.CustomerFeatures.RECEIVING_INFO_PAGE;
            } else if (serviceID.equals("1")) { //If customer buy birds and buy bird nests
                url = Constants.PublicFeatures.PAYMENT_PAGE;
                session.setAttribute("CUSTOMER", customer);
            } else if (serviceID.equals("2")) { //If customer book service matching bird
                url = Constants.PublicFeatures.MATCH_BIRD_AVAILABLE_SERVICE_CONTROLLER;
                session.setAttribute("CUSTOMER", customer);
            } else { //If customer complete payment of bird matching service
                // 
                String orderID = request.getParameter("txtOrderID");
                if (orderID != session.getAttribute("OLD_ORDER_ID")) {
                    OrderDAO odao = new OrderDAO();
                    OrderDetailDAO oddao = new OrderDetailDAO();
                    Products proMale = oddao.getOrderDetailProductGenderByOrderID(orderID, "Male");
                    Products proFemale = oddao.getOrderDetailProductGenderByOrderID(orderID, "Female");
                    session.setAttribute("OLD_ORDER_ID", orderID);
                    //Take the amount the customer has deposited
                    session.setAttribute("DEPOSIT_PRICE", odao.getOrderByOrderID(orderID).getDeposit_Price());
                    //Calculate the amount of male and female babybird
                    session.setAttribute("PRICE_MALE_BABY_BIRD", proMale.getPrice() / 2);
                    session.setAttribute("PRICE_FEMALE_BABY_BIRD", proFemale.getPrice() / 2);
                    //Get the product code of the parent bird
                    session.setAttribute("MALE_BIRD_ID", proMale.getProductID());
                    session.setAttribute("FEMALE_BIRD_ID", proFemale.getProductID());
                }

                session.setAttribute("CUSTOMER", customer);

                url = Constants.CustomerFeatures.PAYMENT_MATCH_BIRD_PAGE;
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
