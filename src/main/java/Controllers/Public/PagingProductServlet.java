/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Public;

import Daos.CategoryDAO;
import Daos.ProductDAO;
import Models.ProductDTO;
import Utils.Constants;
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
        String url = Constants.PublicFeatures.PRODUCT_SHOP_PAGE;
        String searchValue = request.getParameter("lastSearch");
        String productType = request.getParameter("productType");
        String cate = request.getParameter("Category");
        HttpSession session = request.getSession();

        try {
            String product_typeID;
            CategoryDAO catedao = new CategoryDAO();

            if (searchValue == null && request.getAttribute("SEARCH_VALUE") == null) {
                searchValue = "";
            } else if (session.getAttribute("SEARCH_VALUE") != null && searchValue == null) {
                searchValue = (String) request.getAttribute("SEARCH_VALUE");
            }
            if (cate != null) {
                searchValue = cate;
            }

            if (productType == null) {
                product_typeID = "";
            } else {
                product_typeID = (String) session.getAttribute("PRODUCT_TYPE_ID");
            }

            if (page == null) {
                page = "1";
            }
            int indexPage = Integer.parseInt(page);
            int fieldShow = 9;
            ProductDAO dao = new ProductDAO();

            int endPage = dao.getNumberPage(product_typeID.trim(), searchValue.trim(), fieldShow);
            List<ProductDTO> result = dao.getPagingByCreateDateDesc(indexPage, product_typeID.trim(), searchValue.trim(), fieldShow);
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
            request.setAttribute("CATE_LIST", catedao.getAllCate());
            request.setAttribute("SEARCH_VALUE", searchValue);
            request.setAttribute("START", start);
            request.setAttribute("END", end);
            request.setAttribute("indexCurrent", indexPage);
            request.setAttribute("endPage", endPage);

            if (page == null) {
                url = "";
            } else if (page.equals("1")) {
                url = "product_list"
                        + "?productType=" + session.getAttribute("PRODUCT_TYPE");
                session.setAttribute("HISTORY_URL", url);
            } else if (!page.equals("1")) {
                url = "product_list"
                        + "?productType=" + session.getAttribute("PRODUCT_TYPE")
                        + "&page=" + indexPage;
                session.setAttribute("HISTORY_URL", url);
            }

            url = Constants.PublicFeatures.PRODUCT_SHOP_PAGE;

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
