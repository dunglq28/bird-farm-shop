package Controllers.Auth;

import Daos.AccountDAO;
import Daos.CustomerDAO;
import Models.AccountDTO;
import Models.CustomerDTO;
import Models.RegisterError;
import Utils.EmailExample;
import Utils.MyAppConstants;
import Utils.SendMail;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Utils.EncryptPassword;
import java.sql.Date;

@WebServlet(name = "sign-up", urlPatterns = {"/sign-up"})
public class AuthRegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String url = MyAppConstants.PublicFeatures.ERROR_PAGE;
        String email = request.getParameter("txtEmail");
        String Verification = request.getParameter("txtVerification");
        String btn = request.getParameter("btAction");
        String password = request.getParameter("txtPassword");
        String fullname = request.getParameter("txtFullName");
        String gender = request.getParameter("txtGender");
        String day = request.getParameter("txtDay");
        String month = request.getParameter("txtMonth");
        String year = request.getParameter("txtYear");

        RegisterError error = new RegisterError();
        boolean foundErr = false;
        AccountDAO accDao = new AccountDAO();
        CustomerDAO cusDao = new CustomerDAO();
        EmailExample emailExample = new EmailExample();
        HttpSession session = request.getSession();

        try {
            Date dOB = null;
            if (!day.isEmpty() && !month.isEmpty() && !year.isEmpty()) {
                String dOBString = year + "-" + month + "-" + day;
                dOB = Date.valueOf(dOBString);
            }

            session.setAttribute("EMAIL", email);
            boolean emailErr = false;
            if (email.trim().isEmpty()) {
                foundErr = true;
                emailErr = true;
                error.setEmptyEmail("Please enter your email!");
            } else if (!emailExample.validate(email.trim())) {
                foundErr = true;
                emailErr = true;
                error.setWrongEmail("Email invalidate!");
            }

            if (btn.equals("Send") && accDao.checkExistEmail(email.trim()) != null && !foundErr) {
                foundErr = true;
                emailErr = true;
                error.setEmptyEmail("The Email was registered!");
            } else if (btn.equals("Send") && accDao.checkExistEmail(email.trim()) == null) {
                SendMail mailHome = new SendMail();
                int ranNum = (int) Math.floor(((Math.random() * 899999) + 100000));
                String subject = "Confirm your Email";
                String text = "Confirm your Email, <br><br>"
                        + "NOTE DO NOT SHARE THE CODE WITH ANYONE, including BirdFarmShop employees!! <br><br>"
                        + "<h1>" + ranNum + "</h1>"
                        + "To complete your request with BirdFarmSHop Account Registration, please enter 6 digits on the Email Verification Page: <br>"
                        + "Best regards, <br>"
                        + "BirdFarmShop";
                mailHome.sendCode(email, subject, text);
                session.setAttribute("CODE", ranNum);
                response.sendRedirect("http://localhost:8084/BirdFarmShop/guest?btAction=registerPage");
                return;
            }

            if (password.trim().isEmpty() && !btn.equals("Send") && session.getAttribute("CODE") != null) {
                foundErr = true;
                error.setEmptyPassword("Please enter your Password!");
            } else if (password.trim().length() < 6 && !btn.equals("Send") && session.getAttribute("CODE") != null
                    || password.trim().length() > 20 && !btn.equals("Send") && session.getAttribute("CODE") != null) {
                foundErr = true;
                error.setWrongPassword("Password must be 6 to 20 characters");
            }
            if (fullname.trim().isEmpty() && !btn.equals("Send") && session.getAttribute("CODE") != null) {
                foundErr = true;
                error.setEmptyFullName("Please enter your Fullname!");
            }

            if (Verification.trim().isEmpty() && session.getAttribute("CODE") != null || !emailErr && session.getAttribute("CODE") == null) {
                foundErr = true;
                error.setEmptyVerification("Please enter your Verification!");
            } else if (!Verification.equals(String.valueOf(session.getAttribute("CODE"))) && session.getAttribute("CODE") != null) {
                foundErr = true;
                error.setWrongVerification("Verification code is not correct!");
            }

            if (foundErr) {
                request.setAttribute("CREATE_ERROR", error);
                url = MyAppConstants.AuthFeatures.REGISTER_PAGE;

            } else {
                long millis = System.currentTimeMillis();
                java.sql.Date date = new java.sql.Date(millis);
                EncryptPassword encrypt = new EncryptPassword();
                String en_pass = encrypt.toSHA1(password);
                AccountDTO account = new AccountDTO(accDao.createAccountID(), en_pass, fullname, email, date, "Register", 4, "Customer", true);
                CustomerDTO customer = new CustomerDTO(cusDao.createCustomerID(), account.getAccountID(), account.getFullName(),
                        gender, account.getEmail(), null, null, null, dOB, account.getDate_created(), true);
                accDao.createAccount(account);
                cusDao.createCustomer(customer);
                session.setAttribute("ACCOUNT", account);
                url = session.getAttribute("HISTORY_URL") == null ? MyAppConstants.PublicFeatures.HOME_CONTROLLER
                        : (String) session.getAttribute("HISTORY_URL");
            }
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();

        } finally {

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
