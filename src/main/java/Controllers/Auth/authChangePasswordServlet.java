package Controllers.Auth;

import Daos.AccountDAO;
import Models.AccountDTO;
import Models.RegisterError;
import Utils.EncryptPassword;
import Utils.MyAppConstants;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "changePassword", urlPatterns = {"/changePassword"})
public class authChangePasswordServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm_password");
        String url = MyAppConstants.PublicFeatures.ERROR_PAGE;
        try {
            HttpSession session = request.getSession();
            AccountDTO dto = (AccountDTO) session.getAttribute("ACCOUNT");
            AccountDAO dao = new AccountDAO();
            EncryptPassword encrypt = new EncryptPassword();
            RegisterError error = new RegisterError();
            boolean foundErr = false;
            if (password.trim().isEmpty()) {
                foundErr = true;
                error.setEmptyPassword("Please enter your Password!");
            } else if (password.trim().length() < 6
                    || password.trim().length() > 20) {
                foundErr = true;
                error.setWrongPassword("Password must be 6 to 20 characters");
            }
            if (!confirm_password.equals(password)) {
                foundErr = true;
                error.setConfirmError("Confrim password does not match!");
            }
            if (foundErr) {
                request.setAttribute("CHANGE_ERROR", error);
                url = MyAppConstants.AuthFeatures.CHANGE_PASS_PAGE;
            } else {
                String pass = encrypt.toSHA1(password);
                boolean result = dao.updatePasswordByAccountID(dto.getAccountID(), pass);
                if(result){
                    url = MyAppConstants.AuthFeatures.LOGIN_PAGE;
                }
            }

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(authChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(authChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(authChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(authChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
