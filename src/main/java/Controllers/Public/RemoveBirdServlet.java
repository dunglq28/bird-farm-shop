package Controllers.Public;

import Cart.CartObj;
import Utils.MyAppConstants;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "remove-bird", urlPatterns = {"/remove-bird"})
public class RemoveBirdServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = MyAppConstants.PublicFeatures.PRODUCT_SHOP_PAGE;
        try {
            HttpSession session = request.getSession(false);
            CartObj cart = (CartObj) session.getAttribute("BIRD_CART");
            if (cart == null) {
                cart = new CartObj();
            }
            String BirdID = request.getParameter("BirdID");
//            String name = request.getParameter("BirdName");
//            String img = request.getParameter("image");
//            float price = Float.parseFloat(request.getParameter("price"));
//            int quantity = Integer.parseInt(request.getParameter("Bird_Quantity"));

            cart.removeBirdFromCart(BirdID);
            session.setAttribute("BIRDCART", cart);
            session.setAttribute("CART_QUANTITY_PRODUCT", cart.getItemsLength());

            url = "cart";
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
