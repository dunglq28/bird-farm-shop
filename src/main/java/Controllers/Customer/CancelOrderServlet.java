/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Customer;

import Daos.OrderDAO;
import Daos.OrderDetailDAO;
import Daos.ProductDAO;
import Models.ProductDTO;
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
@WebServlet(name = "CancelOrder", urlPatterns = {"/CancelOrder"})
public class CancelOrderServlet extends HttpServlet {

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
        String url = MyAppConstants.CustomerFeatures.MY_ORDER_CONTROLLER;
        String orderID = request.getParameter("orderID");
        String serviceID = request.getParameter("txtServiceID");
        String status = request.getParameter("status");
        HttpSession session = request.getSession();

        try {
            if (!status.equals("Cancel")) {
                OrderDAO odao = new OrderDAO();
                odao.UpdateStatusOrder(orderID, "Cancel");
                OrderDetailDAO oddao = new OrderDetailDAO();
                List<ProductDTO> productIDList = oddao.getOrderDetailProductByOrderID(orderID);
                ProductDAO prodao = new ProductDAO();
                ProductDTO prodto = new ProductDTO();
                if (serviceID.equals("1")) {
                                    //Thêm code ở đây nè
                    for (ProductDTO pro : productIDList) {
                        prodto = prodao.getAllQuantityByProductID(pro.getProductID());
                        prodao.updateQuantityAfterOrder(prodto.getQuantity_Available() + 1, prodto.getQuantity_AreMating(),
                                prodto.getQuantity_Sold() - 1, prodto.getProductID());
                    }
                } else {
                    for (ProductDTO pro : productIDList) {
                        prodto = prodao.getAllQuantityByProductID(pro.getProductID());
                        prodao.updateQuantityAfterOrder(prodto.getQuantity_Available() + 1, prodto.getQuantity_AreMating() - 1,
                                prodto.getQuantity_Sold(), prodto.getProductID());
                    }
                }
                session.setAttribute("SERVICE_ID_CANCEL", serviceID);
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
