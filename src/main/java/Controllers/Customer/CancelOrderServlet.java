package Controllers.Customer;

import Daos.AccountDAO;
import Daos.OrderDAO;
import Daos.OrderDetailDAO;
import Daos.ProductDAO;
import Models.AccountDTO;
import Models.OrderDTO;
import Models.ProductDTO;
import Object.Products;
import Utils.Constants;
import Utils.SendMail;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CancelOrder", urlPatterns = {"/CancelOrder"})
public class CancelOrderServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = Constants.CustomerFeatures.MY_ORDER_CONTROLLER;
        String orderID = request.getParameter("orderID");
        String serviceID = request.getParameter("txtServiceID");
        String status = request.getParameter("status");
        HttpSession session = request.getSession();

        try {
            if (!status.equals("Cancel")) {
                OrderDAO odao = new OrderDAO();
                OrderDTO oDTO = odao.getOrderByOrderID(orderID);
                AccountDAO aDAO = new AccountDAO();
                List<AccountDTO> aDTO = aDAO.getAdminEmail();
                odao.UpdateStatusOrder(orderID, "Cancel");
                OrderDetailDAO oddao = new OrderDetailDAO();
                List<Products> productIDList = oddao.getOrderDetailProductByOrderID(orderID);
                ProductDAO prodao = new ProductDAO();
                ProductDTO prodto = new ProductDTO();
                if (serviceID.equals("1")) {
                    //Thêm code ở đây nè
                    for (Products pro : productIDList) {
                        prodto = prodao.getAllQuantityByProductID(pro.getProductID());
                        prodao.updateQuantityAfterOrder(prodto.getQuantity_Available() + pro.getQuantityBuy(), prodto.getQuantity_AreMating(),
                                prodto.getQuantity_Sold() - pro.getQuantityBuy(), prodto.getProductID());
                    }
                    if (oDTO.getPayBy().equals("VNPAY")) {
                        for (AccountDTO dto : aDTO) {
                            SendMail mailHome = new SendMail();
                            String subject = "Refund invoice to customer ";
                            String text = "Refund request, <br><br>"
                                    + "The Order" + orderID + "  pay by VNPay has been cancelled please contact with the customer to refund money <br><br>"
                                    + "PLEASE notice that all admin will receive this email, make sure that only one person do this action<br>"
                                    + "Best regards, <br>"
                                    + "BirdFarmShop";
                            mailHome.sendCode(dto.getEmail(), subject, text);
                        }
                    }
                } else {
                    for (Products pro : productIDList) {
                        prodto = prodao.getAllQuantityByProductID(pro.getProductID());
                        prodao.updateQuantityAfterOrder(prodto.getQuantity_Available() + 1, prodto.getQuantity_AreMating() - 1,
                                prodto.getQuantity_Sold(), prodto.getProductID());
                    }
                    session.setAttribute("SERVICE_ID_CANCEL", serviceID);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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