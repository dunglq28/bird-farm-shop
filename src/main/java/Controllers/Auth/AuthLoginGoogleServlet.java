/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Auth;

import Daos.AccountDAO;
import Daos.CustomerDAO;
import Models.AccountDTO;
import Models.CustomerDTO;
import Models.UserGoogleDTO;
import Utils.GoogleUtils;
import Utils.MyAppConstants;
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
@WebServlet(name = "login-google", urlPatterns = {"/login-google"})
public class AuthLoginGoogleServlet extends HttpServlet {

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
        String url = "";
        try {
            String code = request.getParameter("code");

            if (code == null || code.isEmpty()) {
                url = MyAppConstants.AuthFeatures.LOGIN_PAGE;
            } else {
                String accessToken = GoogleUtils.getToken(code);
                UserGoogleDTO googlePojo = GoogleUtils.getUserInfo(accessToken);
                AccountDAO dao = new AccountDAO();
                AccountDTO account = dao.getAccountByEmail(googlePojo.getEmail());
                CustomerDAO cusDao = new CustomerDAO();
                HttpSession session = request.getSession();
                if (account != null) {
                    session.setAttribute("ACCOUNT", account);
                    url = MyAppConstants.PublicFeatures.HOME_PAGE;
                } else {
                    long millis = System.currentTimeMillis();
                    java.sql.Date date = new java.sql.Date(millis);
                    account = new AccountDTO(googlePojo.getId(), null, googlePojo.getName(), googlePojo.getEmail(), date, "Google", 1, "Customer", true);
                    if (dao.createAccount(account)) {
                        CustomerDTO customer = new CustomerDTO(cusDao.createCustomerID(), account.getAccountID(), account.getFullName(),
                                null, account.getEmail(), null, null, null, null, account.getDate_created(), true);
                        cusDao.createCustomer(customer);
                        url = MyAppConstants.PublicFeatures.HOME_PAGE;
                        session.setAttribute("ACCOUNT", account);
                    } else {
                        url = MyAppConstants.PublicFeatures.ERROR_PAGE;
                    }
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
