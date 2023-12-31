package Controllers.Customer;

import Daos.OrderDAO;
import Daos.OrderDetailDAO;
import Models.AccountDTO;
import Models.OrderDTO;
import Utils.Constants;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Order", urlPatterns = {"/Order"})
public class MyOrderServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = Constants.CustomerFeatures.MY_ORDER_PAGE;
        String status = request.getParameter("Status");
        String serviceID = request.getParameter("txtServiceID");
        HttpSession session = request.getSession();
        try {
            AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
            if (account == null) { // If customers don't login return to home
                url = Constants.PublicFeatures.HOME_CONTROLLER;
                response.sendRedirect(url);
                return;
            }
            if (status == null || status.equals("All")) { // set status empty to view all status (relative)
                status = "";
            } else if (status.equals("Canceled")) {
                status = "Cancel";
            }

            if (serviceID == null && session.getAttribute("SERVICE_ID_CANCEL") != null) {
                serviceID = (String) session.getAttribute("SERVICE_ID_CANCEL");
                session.removeAttribute("SERVICE_ID_CANCEL");
            } else if (serviceID == null) {// default serviceID is 1
                serviceID = "1";
            }

            OrderDAO oDao = new OrderDAO();
            OrderDetailDAO odDao = new OrderDetailDAO();
            // Get all order of customer with status customer choose and service
            List<OrderDTO> order = oDao.getOrderByAccountID(account.getAccountID(), status, Integer.parseInt(serviceID));
            //Set order to view
            session.setAttribute("ORDER_LIST", order);
            request.setAttribute("STATUS_ORDER", status);
            request.setAttribute("SERVICE_ID", serviceID);

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
