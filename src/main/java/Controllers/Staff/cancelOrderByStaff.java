package Controllers.Staff;

import Daos.Bird_Nest_TrackingDAO;
import Daos.OrderDAO;
import Daos.OrderDetailDAO;
import Daos.ProductDAO;
import Models.AccountDTO;
import Models.OrderDTO;
import Models.ProductDTO;
import Object.Products;
import Utils.Constants;
import Utils.SendMail;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "cancelOrderByStaff", urlPatterns = {"/cancelOrderByStaff"})
public class cancelOrderByStaff extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String url = Constants.StaffFeatures.VIEW_MY_ORDER_CONTROLLER;
        String orderID = request.getParameter("orderID");
        String serviceID = request.getParameter("txtServiceID");
        String status = request.getParameter("status");
        String product_check = request.getParameter("check_box");
        HttpSession session = request.getSession();
        try {
            if (!status.equals("Cancel")) {
                OrderDAO odao = new OrderDAO();
//                OrderDTO oDTO = odao.getOrderByOrderID(orderID);
                odao.UpdateStatusOrder(orderID, "Cancel");
                OrderDetailDAO oddao = new OrderDetailDAO();
                List<Products> productIDList = oddao.getOrderDetailProductByOrderID(orderID);
                ProductDAO prodao = new ProductDAO();
                ProductDTO prodto = new ProductDTO();
                if (serviceID.equals("1")) {
                    int quantity_cancel = 0;
                    int quantity_sold_update = 0;
                    url = Constants.StaffFeatures.VIEW_MY_ORDER_CONTROLLER + "?txtServiceID=1";
                    for (Products pro : productIDList) {
                        prodto = prodao.getAllQuantityByProductID(pro.getProductID());
                        quantity_sold_update = pro.getQuantityBuy();
                        if (product_check != null) {
                            quantity_cancel = pro.getQuantityBuy();
                        } else {
                            quantity_cancel = 0;
                        }
                        prodao.updateQuantityAfterOrder(prodto.getQuantity_Available() + quantity_cancel, prodto.getQuantity_AreMating(),
                                prodto.getQuantity_Sold() - quantity_sold_update, prodto.getProductID());
                    }
                } else {
                    Bird_Nest_TrackingDAO trackingDao = new Bird_Nest_TrackingDAO();
                    for (Products pro : productIDList) {
                        trackingDao.updateStatusBirdNestTracking(orderID, "Cancel");
                        prodto = prodao.getAllQuantityByProductID(pro.getProductID());
                        prodao.updateQuantityAfterOrder(prodto.getQuantity_Available() + 1, prodto.getQuantity_AreMating() - 1,
                                prodto.getQuantity_Sold(), prodto.getProductID());
                    }
                    url = Constants.StaffFeatures.VIEW_MY_ORDER_CONTROLLER + "?txtServiceID=2";
                }
                session.setAttribute("CANCEL_SERVICE", serviceID);
                session.setAttribute("STATUS_CANCEL", status);
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
            Logger.getLogger(cancelOrderByStaff.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(cancelOrderByStaff.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(cancelOrderByStaff.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(cancelOrderByStaff.class.getName()).log(Level.SEVERE, null, ex);
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