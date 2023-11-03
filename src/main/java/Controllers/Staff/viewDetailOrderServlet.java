/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Staff;

import Daos.BirdNestDetail_TrackingDAO;
import Daos.OrderDAO;
import Daos.OrderDetailDAO;
import Models.AccountDTO;
import Models.BirdNestDetail_TrackingDTO;
import Models.OrderDTO;
import Utils.MyAppConstants;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
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
@WebServlet(name = "viewDetailOrder", urlPatterns = {"/viewDetailOrder"})
public class viewDetailOrderServlet extends HttpServlet {

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
        String url = MyAppConstants.PublicFeatures.ERROR_404_PAGE;
        String orderID = request.getParameter("OrderID");
        HttpSession session = request.getSession();

        try {
            AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
            if (account == null || account.getRoleName().equals("Customer")) {
                url = MyAppConstants.PublicFeatures.HOME_CONTROLLER;
                return;
            }
            OrderDAO dao = new OrderDAO();
            OrderDTO order = dao.getOrderByOrderID(orderID);
            request.setAttribute("ORDER", order);
            OrderDetailDAO oddao = new OrderDetailDAO();
            request.setAttribute("ORDER_DETAIL", oddao.getOrderDetailByOrderID(orderID));
            if (order.getServiceID() == 1) {
                url = MyAppConstants.StaffFeatures.ORDER_DETAIL_STAFF_PAGE;
            } else {
                BirdNestDetail_TrackingDAO trackingDetail = new BirdNestDetail_TrackingDAO();
                List<BirdNestDetail_TrackingDTO> trackingNote = trackingDetail.getListTrackingByOrderId(orderID);
                request.setAttribute("BIRD_TRACKING_NOTE", trackingNote);
                request.setAttribute("PARENT_BIRD", oddao.getParentProductByOrderID(orderID));
                url = MyAppConstants.StaffFeatures.TRACKING_COUPLE_BIRD_DETAIL_PAGE;
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
