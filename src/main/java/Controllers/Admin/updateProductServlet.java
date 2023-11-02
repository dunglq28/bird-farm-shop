/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Admin;

import Daos.CategoryDAO;
import Daos.ProductDAO;
import Models.AccountDTO;
import Models.ProductDTO;
import Utils.MyAppConstants;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(name = "updateProduct", urlPatterns = {"/updateProduct"})
public class updateProductServlet extends HttpServlet {

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
        String url = MyAppConstants.PublicFeatures.ERROR_404_PAGE;
        String productID = request.getParameter("ProductID");
        HttpSession session = request.getSession();

        try {
            AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
            if (account == null || account.getRoleName().equals("Customer")) {
                url = MyAppConstants.PublicFeatures.HOME_CONTROLLER;
                return;
            }
            CategoryDAO catedao = new CategoryDAO();
            ProductDAO prodao = new ProductDAO();
            ProductDTO prodto = prodao.getProductByID(productID);
            request.setAttribute("PRODUCT_UPDATE", prodto);
            request.setAttribute("CATE_LIST", catedao.getAllCate());
            if (prodto.getProduct_TypeID() == 2) {
                request.setAttribute("MALE_BIRD_LIST", prodao.getBirdByGender("Male", prodto.getCategoryID(), 0));
                request.setAttribute("FEMALE_BIRD_LIST", prodao.getBirdByGender("Female", prodto.getCategoryID(), 0));
            }
            request.setAttribute("PRODUCT_TYPE", prodto.getProduct_TypeID());
            url = MyAppConstants.AdminFeatures.UPDATE_PRODUCT_PAGE;

            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
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
