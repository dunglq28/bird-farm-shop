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
import Utils.FacebookUtils;
import Utils.MyAppConstants;
import com.restfb.types.User;
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
@WebServlet(name = "login-facebook", urlPatterns = {"/login-facebook"})
public class AuthLoginFaceBookServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        String url = session.getAttribute("BACK_CART") == null ? MyAppConstants.PublicFeatures.HOME_CONTROLLER
                : (String) session.getAttribute("BACK_CART");
        try {
            String code = request.getParameter("code");

            if (code == null || code.isEmpty()) {
                url = MyAppConstants.AuthFeatures.LOGIN_PAGE;
            } else {
                String accessToken = FacebookUtils.getToken(code);
                User user = FacebookUtils.getUserInfo(accessToken);

                AccountDAO dao = new AccountDAO();
                AccountDTO account = dao.checkExistFaceBook(user.getId());

                CustomerDAO cusDao = new CustomerDAO();
                if (account != null) {
                    session.setAttribute("ACCOUNT", account);
                } else {
                    long millis = System.currentTimeMillis();
                    java.sql.Date date = new java.sql.Date(millis);
                    account = new AccountDTO(user.getId(), null, user.getName(), null, date, "FaceBook", 4, "Customer", true);
                    if (dao.createAccount(account)) {
                        CustomerDTO customer = new CustomerDTO(cusDao.createCustomerID(), account.getAccountID(), account.getFullName(),
                                null, account.getEmail(), null, null, null, null, account.getDate_created(), true);
                        cusDao.createCustomer(customer);
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
