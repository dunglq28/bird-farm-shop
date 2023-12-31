package Controllers.Admin;

import Daos.AccountDAO;
import Daos.OrderDAO;
import Daos.StaffDAO;
import Models.OrderDTO;
import Models.StaffDTO;
import Utils.Constants;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "updatedAccountStatus", urlPatterns = {"/updatedAccountStatus"})
public class updatedAccountStatus extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String url = Constants.AdminFeatures.VIEW_ALL_ACCOUNT_CONTROLLER;
        String status = request.getParameter("status");
        String accountID = request.getParameter("accountID");
        try {
            boolean status_update;
            status_update = status.equals("Enable");
            AccountDAO dao = new AccountDAO();
//            OrderDAO ord = new OrderDAO();
            StaffDAO staff = new StaffDAO();
            boolean result = dao.UpdatedStatus(accountID, status_update);
            if (result) {
                if (status_update == true){
                    url = Constants.AdminFeatures.VIEW_ALL_ACCOUNT_CONTROLLER;
                }else{
                    StaffDTO staffDTO = staff.getStaffByAccountID(accountID);
                    if (staffDTO.getStaffID()!=null){
                        boolean staff_result = staff.UpdateStaff(staffDTO.getStaffID());
                        if (staff_result){
//                            List<OrderDTO> orderList = staff.GetDestroyListStaffOrders(staffDTO.getStaffID());
//                            while (orderList != null) {
//                                ord.UpdateStatusOrder(staffDTO.getStaffID(), "Wait for confirmation");
//                            }
                            dao.UpdatedStatus(accountID, status_update);
                            url = Constants.AdminFeatures.VIEW_ALL_ACCOUNT_CONTROLLER;
                        } else {
                            url = Constants.PublicFeatures.ERROR_404_PAGE;
                        }
                    } 
                }
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
            Logger.getLogger(updatedAccountStatus.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(updatedAccountStatus.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(updatedAccountStatus.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(updatedAccountStatus.class.getName()).log(Level.SEVERE, null, ex);
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
