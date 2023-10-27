package Controllers.Staff;

import Daos.OrderDAO;
import Daos.StaffDAO;
import Models.AccountDTO;
import Models.OrderDTO;
import Models.StaffDTO;
import Utils.MyAppConstants;
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
import javax.servlet.http.HttpSession;

@WebServlet(name = "viewMyOrder-staff", urlPatterns = {"/viewMyOrder-staff"})
public class viewMyOrder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String url = MyAppConstants.PublicFeatures.ERROR_404_PAGE;
        String serviceID = request.getParameter("txtServiceID");
        String status = request.getParameter("Status");
        String page = request.getParameter("page");
        HttpSession session = request.getSession();
        try {
            AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
            if (account == null || !account.getRoleName().equals("Staff")) {
                url = MyAppConstants.PublicFeatures.HOME_CONTROLLER;
                return;
            }
            if (serviceID == null) {
                serviceID = "1";
            }
            if (status == null || status.equals("All")) {
                status = "";
            }
            if (page == null) {
                page = "1";
            }
            int indexPage = Integer.parseInt(page);
            OrderDAO dao = new OrderDAO();
            StaffDAO staffdao = new StaffDAO();
            StaffDTO staDTO = staffdao.getStaffByAccountID(account.getAccountID());
            int endPage = dao.getMyOrderPage(staDTO.getStaffID(), Integer.parseInt(serviceID), status);
            List<OrderDTO> result = dao.MyOrders(staDTO.getStaffID(), Integer.parseInt(serviceID), status, indexPage);

            int start = 1;
            int distance = 4;

            int end;
            if (endPage < distance) {
                end = endPage;
            } else {
                end = start + distance;
            }

            if (indexPage >= 4) {
                start = indexPage - 2;
                end = indexPage + 2;
                if (indexPage + distance >= endPage) {
                    start = endPage - distance;
                    end = endPage;
                }
            }
            request.setAttribute("MY_ORDERS_STAFF", result);
            request.setAttribute("SERVICE_ID", serviceID);
            request.setAttribute("STATUS_ORDER", status);
            request.setAttribute("START", start);
            request.setAttribute("END", end);
            request.setAttribute("indexCurrent", indexPage);
            request.setAttribute("endPage", endPage);
            url = MyAppConstants.StaffFeatures.STAFF_ORDER_PAGE;

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
            Logger.getLogger(viewMyOrder.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(viewMyOrder.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(viewMyOrder.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(viewMyOrder.class.getName()).log(Level.SEVERE, null, ex);
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
