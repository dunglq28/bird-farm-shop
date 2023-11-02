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
import Utils.S3Util;
import Utils.Validation;
import com.amazonaws.services.s3.model.S3DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author hj
 */
@WebServlet(name = "createProduct", urlPatterns = {"/createProduct"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 11 // 11MB
)
public class createProductServlet extends HttpServlet {

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
        String button = request.getParameter("btAction");
        String productType = request.getParameter("productTypeID");
        String cateID = request.getParameter("cateID");
        String proName = request.getParameter("nameBird");
        String dadbirdID = request.getParameter("dadBirdID");
        String momBirdID = request.getParameter("momBirdID");
        String age = request.getParameter("Age");
        String color = request.getParameter("Color");
        String gender = request.getParameter("Gender");
        String qtyAvailable = request.getParameter("Quantity");
        String qtyMaleBaby = request.getParameter("qtyMaleBaby");
        String qtyFemaleBaby = request.getParameter("qtyFemaleBaby");
        String price = request.getParameter("Price");
        String discount = request.getParameter("Discount");
        String characteristics = request.getParameter("Characteristic");
        String detail = request.getParameter("Detail");
        Part filePart = request.getPart("file");
        HttpSession session = request.getSession();

        try {
            boolean flag = true;
            AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
            if (account == null || account.getRoleName().equals("Customer")) {
                url = MyAppConstants.PublicFeatures.HOME_CONTROLLER;
                return;
            }
            if (!Validation.checkNumberGreater0(qtyAvailable)) {
                request.setAttribute("ERROR_QTY_AVAI", "Number must be greater than 0");
                flag = false;
            }
            if (!Validation.checkNumberGreater0(qtyMaleBaby)) {
                request.setAttribute("ERROR_QTY_MBAY", "Number must be greater than 0");
                flag = false;
            }
            if (!Validation.checkNumberGreater0(qtyFemaleBaby)) {
                request.setAttribute("ERROR_QTY_FMBABY", "Number must be greater than 0");
                flag = false;
            }
            if (!Validation.checkNumberGreater0(price)) {
                request.setAttribute("ERROR_PRICE", "Number must be greater than 0");
                flag = false;
            }
            if (!Validation.checkNumberGreater0(discount)) {
                request.setAttribute("ERROR_DISCOUNT", "Number must be greater than 0");
                flag = false;
            }

            CategoryDAO catedao = new CategoryDAO();
            ProductDAO prodao = new ProductDAO();
            String urlImage;
            if (!filePart.getSubmittedFileName().isEmpty() && productType != null && cateID != null && flag) {
                String fileName = getFileName(filePart);
                String newProID = prodao.createProductID();
                long millis = System.currentTimeMillis();
                java.sql.Date orderDate = new java.sql.Date(millis);
//                S3Util.uploadFile(fileName, filePart.getInputStream());
                if (productType.equals("1")) {
                    urlImage = "https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/" + fileName;
                    ProductDTO newPro = new ProductDTO(newProID, proName, Integer.parseInt(cateID), Integer.parseInt(productType),
                            null, null, age, color, gender, urlImage,
                            0, 0, Integer.parseInt(qtyAvailable),
                            0, 0, Float.parseFloat(price), characteristics, detail, orderDate, Float.parseFloat(discount)/100, true);
                    prodao.createProduct(newPro);
                    url = MyAppConstants.AdminFeatures.VIEW_ALL_PRODUCT_CONTROLLER;
                    response.sendRedirect(url);
                    return;
                } else {
                    urlImage = "https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/" + fileName;
                    ProductDTO newPro = new ProductDTO(newProID, proName, Integer.parseInt(cateID), Integer.parseInt(productType),
                            dadbirdID, momBirdID, null, null, null, urlImage,
                            Integer.parseInt(qtyMaleBaby), Integer.parseInt(qtyFemaleBaby), Integer.parseInt(qtyAvailable),
                            0, 0, Float.parseFloat(price), characteristics, detail, orderDate, Float.parseFloat(discount)/100, true);
                    prodao.createProduct(newPro);
                    url = MyAppConstants.AdminFeatures.VIEW_ALL_PRODUCT_CONTROLLER;
                    response.sendRedirect(url);
                    return;
                }
            }

            if (productType.equals("2") && cateID != null) {
                request.setAttribute("MALE_BIRD_LIST", prodao.getBirdByGender("Male", Integer.parseInt(cateID), 0));
                request.setAttribute("FEMALE_BIRD_LIST", prodao.getBirdByGender("Female", Integer.parseInt(cateID), 0));
            }
            request.setAttribute("CATE_CHOOSE", cateID);
            request.setAttribute("CATE_LIST", catedao.getAllCate());
            request.setAttribute("PRODUCT_TYPE", productType);
            url = MyAppConstants.AdminFeatures.CREATE_PRODUCT_PAGE;

            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {

        }
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        int beginIndex = contentDisposition.indexOf("filename=") + 10;
        int endIndex = contentDisposition.length() - 1;

        return contentDisposition.substring(beginIndex, endIndex);
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
