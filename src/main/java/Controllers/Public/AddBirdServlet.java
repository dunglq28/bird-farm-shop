package Controllers.Public;

import Cart.CartObj;
import Object.Products;
import Utils.MyAppConstants;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
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
        String url = MyAppConstants.PublicFeatures.HOME_CONTROLLER;
        String birdID = request.getParameter("txtproductID");
        String name = request.getParameter("txtproductName");
        String cate_Name = request.getParameter("category_Name");
        String img = request.getParameter("image");
        String age = request.getParameter("txtAge");
        String color = request.getParameter("color");
        String gender = request.getParameter("txtGender");
        float price = Float.parseFloat(request.getParameter("price"));
        float discount = Float.parseFloat(request.getParameter("txtDiscount"));
        int quantityBuy = Integer.parseInt(request.getParameter("quantity_Buy"));
        int quantityAvailable = Integer.parseInt(request.getParameter("quantity_Available"));
        int quantitySold = Integer.parseInt(request.getParameter("quantity_Sold"));
        String lastSearch = request.getParameter("lastsearch");
        String page = request.getParameter("page");
        HttpSession session = request.getSession(true);

        try {
            CartObj cart = (CartObj) session.getAttribute("BIRD_CART");
            if (cart == null) {
                cart = new CartObj();
            }
            Products prodcut = null;
            if (age == null && color == null && gender == null) {
                prodcut = new Products(name, cate_Name, img, quantityAvailable, quantityBuy, quantitySold, price, discount);
            } else {
                prodcut = new Products(birdID ,name, cate_Name, age, color, gender, img, quantityAvailable, quantityBuy, quantitySold, price, discount);
            }

            cart.addItemToCart(birdID, prodcut);
            session.setAttribute("BIRD_CART", cart);
            session.setAttribute("CART_QUANTITY_PRODUCT", cart.getItemsLength());

            url = (String) session.getAttribute("HISTORY_URL");

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
