/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Public;

import Cart.CartObj;
import Daos.CustomerDAO;
import Daos.ProductDAO;
import Daos.OrderDAO;
import Daos.OrderDetailDAO;
import Models.AccountDTO;
import Models.ProductDTO;
import Models.CustomerDTO;
import Models.OrderDTO;
import Models.OrderDetailDTO;
import Utils.MyAppConstants;
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
@WebServlet(name = "CheckLoginToCheckoutServlet", urlPatterns = {"/CheckLoginToCheckoutServlet"})
public class CheckLoginToCheckoutServlet extends HttpServlet {

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
        String url = MyAppConstants.PublicFeatures.PAYMENT_PAGE;
        HttpSession session = request.getSession();

        try {

            AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
            CustomerDAO dao = new CustomerDAO();
            CustomerDTO customer = null;
            String serviceID = (String) session.getAttribute("SERVICE_ID");

            if (account == null && serviceID.equals("1")) {
                url = "guest?btAction=loginPage";
                session.setAttribute("HISTORY_URL", "cart");

            } else if (account == null && serviceID.equals("2")) {
                session.setAttribute("HISTORY_URL", MyAppConstants.PublicFeatures.PRODUCT_DETAIL_CONTROLLER);
                url = "guest?btAction=loginPage";

            } else if (account != null) {
                customer = dao.getCustomerByAccountID(account.getAccountID());

                if (customer.getAddress() == null && customer.getCity() == null && customer.getPhone_Number() == null) {
                    request.setAttribute("FULLNAME", customer.getFullName());
                    url = MyAppConstants.CustomerFeatures.RECEIVING_INFO_PAGE;
                } else if (serviceID.equals("1")) {
                    url = MyAppConstants.PublicFeatures.PAYMENT_PAGE;
                    session.setAttribute("CUSTOMER", customer);

                } else if (serviceID.equals("2")) {
                    url = MyAppConstants.PublicFeatures.BIRD_NEST_AVAILABLE_SERVICE_CONTROLLER;
                    session.setAttribute("CUSTOMER", customer);

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
