/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Staff;

import Daos.Bird_Nest_TrackingDAO;
import Daos.OrderDAO;
import Models.OrderDTO;
import Utils.Constants;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "updateStatusTracking", urlPatterns = {"/updateStatusTracking"})
public class updateStatusTracking extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = "";
        String orderId = request.getParameter("orderId");
        String status = request.getParameter("progress");
        try {
            OrderDAO oddao = new OrderDAO();
            OrderDTO oddto = oddao.getOrderByOrderID(orderId);
            if (oddto.getStatus().equals("Cancel")) {
                url = Constants.StaffFeatures.VIEW_MY_ORDER_CONTROLLER + "?txtServiceID=2";
            } else {
                Bird_Nest_TrackingDAO dao = new Bird_Nest_TrackingDAO();
                boolean result = dao.updateStatusBirdNestTracking(orderId, status);
                if (result) {
                    url = Constants.StaffFeatures.NEW_NOTE_CONTROLLER + "?orderId=" + orderId;
                }
            }
        } catch (Exception e) {
            log(e.getMessage());
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
