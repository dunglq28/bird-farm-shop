/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Auth;

import Daos.AccountDAO;
import Models.RegisterError;
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
@WebServlet(name = "AuthResetPassServlet", urlPatterns = {"/AuthResetPassServlet"})
public class AuthResetPassServlet extends HttpServlet {

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

        String url = MyAppConstants.PublicFeatures.ERROR_PAGE;

        String password = request.getParameter("txtPassword");
        String confirm = request.getParameter("txtConfirm");
        String email = request.getParameter("txtContact");
        RegisterError error = new RegisterError();
        boolean foundErr = false;

        try {
            if (password.trim().isEmpty()) {
                foundErr = true;
                error.setEmptyPassword("Please enter your Password!");
            } else if (password.trim().length() < 6 || password.trim().length() > 20) {
                foundErr = true;
                error.setWrongPassword("Password must be 6 to 20 characters");
            }

            if (!confirm.trim().equals(password.trim())) {
                foundErr = true;
                error.setConfirmError("Password does not match Confirm");
            }

            if (foundErr) {
                request.setAttribute("CREATE_ERROR", error);
                url = MyAppConstants.AuthFeatures.RESET_PASS_PAGE;
            } else {
                AccountDAO dao = new AccountDAO();
                boolean result = dao.updatePasswordByEmail(email, password);
                url = MyAppConstants.AuthFeatures.LOGIN_PAGE;
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
