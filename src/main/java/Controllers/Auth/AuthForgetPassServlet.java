/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Auth;

import Daos.AccountDAO;
import Models.AccountDTO;
import Models.LoginError;
import Utils.EmailExample;
import Utils.MyAppConstants;
import Utils.SendMail;
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
@WebServlet(name = "forgetPass", urlPatterns = {"/forgetPass"})
public class AuthForgetPassServlet extends HttpServlet {

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
        String email = request.getParameter("txtContact");
        String url = MyAppConstants.AuthFeatures.FORGET_PASS_PAGE;
        EmailExample emailExample = new EmailExample();
        LoginError error = new LoginError();
        boolean foundErr = false;
        try {
            if (email.trim().isEmpty()) {
                foundErr = true;
                error.setEmptyEmail("Please enter your email!");
            } else if (!emailExample.validate(email.trim())) {
                foundErr = true;
                error.setWrongEmail("Email invalidate!");
            }

            if (foundErr) {
                request.setAttribute("CREATE_ERROR", error);
            } else {
                AccountDAO dao = new AccountDAO();
                AccountDTO account = dao.getAccountByEmail(email);
                if (account == null) {
                    error.setWrongEmail("Email is not registered!");
                    request.setAttribute("CREATE_ERROR", error);
                } else {
                    SendMail mailHome = new SendMail();
                    String resetPassPage = "<a href=" +"http://localhost:8084/BirdFarmShop/guest?btAction=resetPassPage&txtContact="+email + ">click here</a>";
                    String subject = "Change the password";
                    String text = "Hello " + account.getFullName() + ", <br>"
                            + "You have submitted a password change request. Please " +resetPassPage+ " to proceed with changing your password.<br>"
                            + "Thank you for using BirdFarmShop's services <br>"
                            + "Best regards, <br>"
                            + "BirdFarmShop";
                    mailHome.sendCode(email, subject, text);   
                    request.setAttribute("NOTIFICATION", "We have sent an email to " +email + " with a link to reset your password.");
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
