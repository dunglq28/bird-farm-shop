package Controllers.Admin;

import Daos.AccountDAO;
import Daos.AdminDAO;
import Daos.StaffDAO;
import Models.AccountDTO;
import Models.StaffDTO;
import Utils.MyAppConstants;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "updatedAccountRoles", urlPatterns = {"/updatedAccountRoles"})
public class updatedAccountRoles extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String accountid = request.getParameter("accountid");
        String Role = request.getParameter("role");
        String url = MyAppConstants.PublicFeatures.ERROR_404_PAGE;
        try {
            int roleID = 4;
            long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);
            AccountDAO dao = new AccountDAO();
            AccountDTO accDTO = dao.getAccountByID(accountid);
            StaffDAO staffDAO = new StaffDAO();
            StaffDTO staffDTO = new StaffDTO();
            AdminDAO adDAO = new AdminDAO();
            switch (Role) {
                case "Staff":
                    roleID = 3;
                    staffDTO = staffDAO.getStaffByAccountID(accountid);
                    if (staffDTO == null) {
                        StaffDTO staff = new StaffDTO(staffDAO.createStafftID(), accDTO.getFullName(),
                                accDTO.getEmail(), null, null, null,
                                "M1", accountid, date, true);
                        staffDAO.createStaff(staff);
                        url = MyAppConstants.AdminFeatures.VIEW_ALL_ACCOUNT_CONTROLLER;
                        break;
                    } else if (staffDTO.isStatus() == true) {
                        url = MyAppConstants.AdminFeatures.VIEW_ALL_ACCOUNT_CONTROLLER;
                        break;
                    } else {
                        adDAO.UpdatedStaffRole(staffDTO.getStaffID(), true);
                        url = MyAppConstants.AdminFeatures.VIEW_ALL_ACCOUNT_CONTROLLER;
                        break;
                    }

                case "Customer":
                    staffDTO = staffDAO.getStaffByAccountID(accountid);
                    adDAO.UpdatedStaffRole(staffDTO.getStaffID(), false);
                    url = MyAppConstants.AdminFeatures.VIEW_ALL_ACCOUNT_CONTROLLER;
                    break;

                case "Admin":
                    roleID = 1;
                    break;
                default:
                    break;
            }
            boolean result = adDAO.UpdatedRole(accountid, roleID);
            if (result) {
                url = MyAppConstants.AdminFeatures.VIEW_ALL_ACCOUNT_CONTROLLER;
            }

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(updatedAccountRoles.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(updatedAccountRoles.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(updatedAccountRoles.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(updatedAccountRoles.class.getName()).log(Level.SEVERE, null, ex);
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
