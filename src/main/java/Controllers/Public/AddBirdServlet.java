package Controllers.Public;

import Models.BirdDTO;
import Cart.CartObj;
import Utils.MyAppConstants;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "add-bird", urlPatterns = {"/add-bird"})
public class AddBirdServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, NamingException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String url = MyAppConstants.PublicFeatures.SHOPPING_PAGE;
        String BirdID = request.getParameter("BirdID");
        String name = request.getParameter("BirdName");
        String cate_Name = request.getParameter("category_Name");
        String img = request.getParameter("image");
        float price = Float.parseFloat(request.getParameter("price"));
        int quantityBuy = Integer.parseInt(request.getParameter("quantity_Buy"));
        int quantityAvailable = Integer.parseInt(request.getParameter("quantity_Available"));
        String lastSearch = request.getParameter("lastsearch");
        try {
            HttpSession session = request.getSession(true);
            CartObj cart = (CartObj) session.getAttribute("BIRD_CART");
            if (cart == null) {
                cart = new CartObj();
            }
            
            cart.addItemToCart(BirdID, quantityBuy, quantityAvailable, price, img, name, cate_Name);
            session.setAttribute("BIRD_CART", cart);
            session.setAttribute("CART_QUANTITY_PRODUCT", cart.getItemsLength());
            
            if (!lastSearch.isEmpty()) {
                url = "search-product"
                        + "?lastSearch=" + lastSearch;
            } else {
                url = MyAppConstants.PublicFeatures.SHOPPING_PAGE;
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
            Logger.getLogger(AddBirdServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(AddBirdServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddBirdServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AddBirdServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(AddBirdServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddBirdServlet.class.getName()).log(Level.SEVERE, null, ex);
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
