/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Public;

import Daos.ProductDAO;
import Daos.Service_Price_ListDAO;
import Models.ProductDTO;
import Models.Service_Price_ListDTO;
import Object.Products;
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
@WebServlet(name = "BirdNestAvailableServlet", urlPatterns = {"/BirdNestAvailableServlet"})
public class BirdNestAvailableServlet extends HttpServlet {

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
        String url = MyAppConstants.PublicFeatures.SERVICE_OPTION_ONE_PAGE;

        int serviceID = Integer.parseInt(request.getParameter("txtServiceID"));
        String quantityBuy = request.getParameter("quantity_Buy");

        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        try {
            ProductDAO Prodao = new ProductDAO();
            
            ProductDTO Prodto = Prodao.getProductByID((String) session.getAttribute("PRODUCT_ID_SERVICE"));
            Products product = new Products(Prodto.getProductID(), Prodto.getProduct_Name(), Prodto.getCategory_Name(),
                    Prodto.getDad_Bird_ID(), Prodto.getMom_Bird_ID(), Prodto.getImage(), 
                    Prodto.getQuantity_Available(), Integer.parseInt(quantityBuy),Prodto.getQuantity_Sold(), Prodto.getPrice(), Prodto.getDiscount());
            if (quantityBuy != null && product != null) {
                product.setQuantityBuy(Integer.parseInt(quantityBuy));   
            }
            session.setAttribute("BIRD_NEST_CHOOSE", product);
            Service_Price_ListDAO dao = new Service_Price_ListDAO();
            List<Service_Price_ListDTO> dto = dao.getServicePriceByServiceID(serviceID);
            for (Service_Price_ListDTO option : dto) {
                if (option.getMinimum_number_of_eggs() <= product.getQuantityBuy() && option.getMaximum_number_of_eggs() >= product.getQuantityBuy()) {
                    session.setAttribute("SERVICE_PRICE", option.getServicePrice());
                }
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
