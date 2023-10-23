package Controllers.Staff;

import Daos.OrderDAO;
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
import javax.servlet.http.HttpSession;

@WebServlet(name = "acceptOrder-staff", urlPatterns = {"/acceptOrder-staff"})
public class AcceptAnOrders extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String url = MyAppConstants.PublicFeatures.ERROR_404_PAGE;
        String orderID = request.getParameter("orderID");
//        String serviceName = request.getParameter("service");
//        String accountID = request.getParameter("staffID");
//        String acceptOrder = request.getParameter("acceptOrder");
        try {
            HttpSession session = request.getSession();
            AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
            OrderDAO oddao = new OrderDAO();
            StaffDAO staDAO = new StaffDAO();
            StaffDTO staDTO = staDAO.getStaffByAccountID(account.getAccountID());
            boolean odSuccess = oddao.takeActionOrder(staDTO.getStaffID(), orderID, "Processing");
            boolean odDTSuccess = oddao.takeActionOrder_DT(orderID, "Processing");
//            if(serviceName == "Egg incubation is available"){
//                
//            }
            if(odSuccess == true && odDTSuccess == true){
                url = MyAppConstants.StaffFeatures.VIEW_MY_ORDER_CONTROLLER;
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
            Logger.getLogger(AcceptAnOrders.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AcceptAnOrders.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AcceptAnOrders.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AcceptAnOrders.class.getName()).log(Level.SEVERE, null, ex);
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
