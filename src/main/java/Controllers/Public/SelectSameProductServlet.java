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
import java.util.ArrayList;
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
@WebServlet(name = "SelectSameProductServlet", urlPatterns = {"/SelectSameProductServlet"})
public class SelectSameProductServlet extends HttpServlet {

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
        String url = MyAppConstants.PublicFeatures.HOME_CONTROLLER;
        String button = request.getParameter("btAction");

        String product_name = request.getParameter("txtproductName");
        String productTypeID = request.getParameter("txtproductTypeID");
        String productID = "";
        String ageChoose = request.getParameter("txtAge");
        String genderChoose = request.getParameter("txtGender");

        HttpSession session = request.getSession();

        try {
            ProductDTO productCurrent = (ProductDTO) session.getAttribute("PRODUCT_CURRENT");
            
            //After add product to cart get old bird to view
            if (product_name == null && productTypeID == null && ageChoose == null && genderChoose == null) {
                product_name = productCurrent.getProduct_Name();
                productTypeID = String.valueOf(productCurrent.getProduct_TypeID());
                ageChoose = productCurrent.getAge();
                genderChoose = productCurrent.getGender();
            }
            

            ProductDAO dao = new ProductDAO();
            ProductDTO product = null;
            List<ProductDTO> result = null;

            if (productTypeID.equals("1")) {
                result = dao.getProductByName(product_name);
                List<String> ageList = new ArrayList<String>();
                List<String> genderList = new ArrayList<String>();
                //Take all age and gender of same bird
                for (ProductDTO productDto : result) {
                    if (!ageList.contains(productDto.getAge())) {
                        ageList.add(productDto.getAge());
                    }
                    if (!genderList.contains(productDto.getGender())) {
                        genderList.add(productDto.getGender());
                    }
                }

                product = (ProductDTO) session.getAttribute("PRODUCT_CURRENT");
                //Take birds according to the age and gender of the customer's choice
                if (ageChoose != null && genderChoose != null) {
                    for (ProductDTO productDto : result) {
                        if (productDto.getGender().equals(genderChoose) && productDto.getAge().equals(ageChoose)) {
                            productID = productDto.getProductID();
                        }
                    }
                }
                
                //Filter bird gender by age
                if (request.getParameter("txtproductID") == null && !ageChoose.equals(product.getAge())) {
                    genderList.clear();
                    for (ProductDTO productDto : result) {
                        if (productDto.getAge().equals(ageChoose)) {
                            productID = productDto.getProductID();
                            genderList.add(productDto.getGender());
                        }
                    }
                }
                
                // set age and gender list of bird
                request.setAttribute("AGE_LIST", ageList);
                request.setAttribute("GENDER_LIST", genderList);
                product = dao.getProductByID(productID);
                // set bird current customer want to see
                session.setAttribute("PRODUCT_CURRENT", product);
                //Get all bird have a same name to view 
                session.setAttribute("PRODUCT_SAME_NAME", result);
                url = MyAppConstants.PublicFeatures.PRODUCT_DETAIL_PAGE;
                
            } else if (productTypeID.equals("2")) { // show a detail of bird nest
                productID = request.getParameter("txtproductID");
                if (productID == null) {
                    productID = productCurrent.getProductID();
                }
                product = dao.getProductByID(productID);
                // set bird nest and information of parent of bird nest cus choose
                session.setAttribute("PRODUCT_CURRENT", product);
                session.setAttribute("BIRD_DAD", dao.getProductByID(product.getDad_Bird_ID()));
                session.setAttribute("BIRD_MOM", dao.getProductByID(product.getMom_Bird_ID()));

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
