package Controllers.Customer;

import Daos.BirdNestDetail_TrackingDAO;
import Daos.Bird_Nest_TrackingDAO;
import Daos.CustomerDAO;
import Daos.OrderDAO;
import Daos.OrderDetailDAO;
import Models.AccountDTO;
import Models.BirdNestDetail_TrackingDTO;
import Models.Bird_Nest_TrackingDTO;
import Models.OrderDetailDTO;
import Object.Products;
import Utils.MyAppConstants;
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

/**
 *
 * @author hj
 */
@WebServlet(name = "Service_Tracking", urlPatterns = {"/Service_Tracking"})
public class ServiceTrackingServlet extends HttpServlet {

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
        String url = MyAppConstants.CustomerFeatures.SERVICE_TRACKING_PAGE;
        String orderID = request.getParameter("txtOrderID");
        String page = request.getParameter("page");
        String paymentMethod = request.getParameter("PaymentMethod");
        HttpSession session = request.getSession();
        try {
            AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
            if (account == null) { // If customers don't login return to home
                url = MyAppConstants.PublicFeatures.HOME_CONTROLLER;
                response.sendRedirect(url);
                return;
            }

            if (orderID != null) {
                request.setAttribute("ORDER_ID", orderID);
            }
            Bird_Nest_TrackingDAO bntdao = new Bird_Nest_TrackingDAO();

            Bird_Nest_TrackingDTO bntdto = bntdao.getBNTrackingByOrderID(orderID);// get bird nest tracking of order 
            session.setAttribute("BIRD_NEST_TRACKING", bntdto);
            if (session.getAttribute("CUSTOMER") == null) { // Get information of customer 
                CustomerDAO cusdao = new CustomerDAO();
                session.setAttribute("CUSTOMER", cusdao.getCustomerByAccountID(account.getAccountID()));
            }

            if (page == null) { // default page to view is 1
                page = "1";
            }
            int indexPage = Integer.parseInt(page); // parse string to in

            BirdNestDetail_TrackingDAO bndetaildao = new BirdNestDetail_TrackingDAO();
            int fieldShow = 3; // number of field can show on one page
            int endPage = bndetaildao.getNumberPage(bntdto.getBird_Nest_ID(), fieldShow); // get quantity of page
            //retrieve information according to the corresponding page
            List<BirdNestDetail_TrackingDTO> result = bndetaildao.getPagingByUpdateDateDesc(indexPage, bntdto.getBird_Nest_ID(), fieldShow);
            session.setAttribute("BN_DETAIL_TRACKING_LIST", result);

            int start = 1;// default pagination is 1
            int distance = 3; // distance between start and end of pagination (Only 3 pages can be viewed at a time)
            int end;
            if (endPage < distance) { // if end page larger than distance set end = endpage
                end = endPage;
            } else { //if endpage higher than distance 
                end = start + distance;
            }

            // change page can be viewed when end page viewed > page current
            if (indexPage >= 3) {
                start = indexPage - 2;
                end = indexPage + 2;
                if (indexPage + distance >= endPage) {
                    start = endPage - distance;
                    end = endPage;
                }
            }
            request.setAttribute("BEGIN", start);
            request.setAttribute("FINISH", end);
            request.setAttribute("pageCurrent", indexPage);
            request.setAttribute("endPage", endPage);

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
