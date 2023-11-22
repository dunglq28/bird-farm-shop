/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Public;

import Daos.CustomerDAO;
import Models.AccountDTO;
import Models.CustomerDTO;
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
@WebServlet(name = "shipping", urlPatterns = {"/shipping"})
public class InforReceiveServlet extends HttpServlet {

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
        String url = Constants.CustomerFeatures.RECEIVING_INFO_PAGE;
        String totalOrder = request.getParameter("txtTotalOrder");
        String shippingMethod = request.getParameter("shippingMethod");
        String fullName = request.getParameter("txtFullName");
        String phoneNumber = request.getParameter("txtPhone");
        String city = request.getParameter("txtCity");
        String district = request.getParameter("txtDistrict");
        String address = request.getParameter("txtAddress");
        String button = request.getParameter("btAction");
        HttpSession session = request.getSession();

        try {
            AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
            CustomerDAO dao = new CustomerDAO();
            CustomerDTO customer = dao.getCustomerByAccountID(account.getAccountID());;
            request.setAttribute("FULLNAME", customer.getFullName());
            session.setAttribute("CUSTOMER", customer);
            String serviceID = (String) session.getAttribute("SERVICE_ID");

            request.setAttribute("TOTAL_ORDER", totalOrder);
            if (button.equals("Continue")) {
                request.setAttribute("SHIPPING_METHOD", shippingMethod);
                if (shippingMethod.equals("Fast delivery")) {
                    request.setAttribute("SHIPPING_CASH", 125000);
                } else {
                    request.setAttribute("SHIPPING_CASH", 0);
                }
                customer = dao.updateCustomer(fullName, phoneNumber, address, city, district, account.getAccountID());
                session.setAttribute("CUSTOMER", customer);
                request.setAttribute("TOTAL_ORDER", totalOrder);
                if (customer != null && serviceID.equals("1")) {
                    url = Constants.PublicFeatures.PAYMENT_PAGE;
                } else if (customer != null && serviceID.equals("2")) {
                    url = Constants.PublicFeatures.MATCH_BIRD_AVAILABLE_SERVICE_CONTROLLER;
                } else if (customer != null && serviceID.equals("0")) {
                    url = Constants.CustomerFeatures.PAYMENT_MATCH_BIRD_PAGE;
                }
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
