/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Public;

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
@WebServlet(name = "PagingProductServlet", urlPatterns = {"/PagingProductServlet"})
public class PagingProductServlet extends HttpServlet {

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
        String page = request.getParameter("page");
        String url = MyAppConstants.PublicFeatures.PRODUCT_SHOP_PAGE;
        HttpSession session = request.getSession();

        try {

            if (page == null) {
                page = "1";
            }
            int indexPage = Integer.parseInt(page);

            ProductDAO dao = new ProductDAO();
            int product_typeID = (int) session.getAttribute("PRODUCT_TYPE_ID");
            int endPage = dao.getNumberPage(product_typeID);
            List<ProductDTO> result = dao.getPagingByCreateDateDesc(indexPage, product_typeID);
            session.setAttribute("PRODUCT_LIST", result);
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
            session.setAttribute("START", start);
            session.setAttribute("END", end);
            session.setAttribute("indexCurrent", indexPage);
            session.setAttribute("endPage", endPage);

            if (page == null) {
                url ="";
            }
            else if (page.equals("1")) {
                url = "product_list"
                        + "?productType=" + session.getAttribute("PRODUCT_TYPE");
                session.setAttribute("HISTORY_URL", url);
            } else if (!page.equals("1")) {
                url = "product_list"
                        + "?productType=" + session.getAttribute("PRODUCT_TYPE")
                        + "&page=" + indexPage;
                session.setAttribute("HISTORY_URL", url);
            }
            
            url = MyAppConstants.PublicFeatures.PRODUCT_SHOP_PAGE;

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
