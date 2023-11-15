/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Staff;

import Daos.BirdNestDetail_TrackingDAO;
import Daos.Bird_Nest_TrackingDAO;
import Models.BirdNestDetail_TrackingDTO;
import Utils.Constants;
import Utils.S3Util;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Admin
 */
@WebServlet(name = "addTrackingNote", urlPatterns = {"/addTrackingNote"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 11 // 11MB
)
public class addTrackingNote extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String url = "";
        String orderId = request.getParameter("orderId");
        String action = request.getParameter("action");

        try {
            if (action.equals("Add note")) {
                String birdNestId = request.getParameter("birdNestId");
                String eggs = request.getParameter("numberOfEggs");
                String males = request.getParameter("maleBirds");
                String females = request.getParameter("femaleBirds");
                String note = request.getParameter("note");
                Part filePart = request.getPart("file");
                String urlImage = "";
                int numOfEggs = Integer.parseInt(eggs);
                int numOfMales = Integer.parseInt(males);
                int numOfFemales = Integer.parseInt(females);
                long millis = System.currentTimeMillis();
                Date currentDate = new Date(millis);
                BirdNestDetail_TrackingDAO trackingDetail = new BirdNestDetail_TrackingDAO();
                Bird_Nest_TrackingDAO tracking = new Bird_Nest_TrackingDAO();
                if (!filePart.getSubmittedFileName().isEmpty()) {
                    String fileName = getFileName(filePart);
//                    S3Util.uploadFile(fileName, filePart.getInputStream());
                    urlImage = "https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/" + fileName;
                }
                int total = numOfFemales + numOfMales;
                if (total <= numOfEggs) {
                    boolean addNote = trackingDetail.createBirdNestDetailTracking(new BirdNestDetail_TrackingDTO(birdNestId, note, urlImage, currentDate));
                    boolean updateTracking = tracking.updateStatusBirdNestTracking(birdNestId, numOfEggs, numOfMales, numOfFemales, currentDate);
                    if (updateTracking && addNote) {
                        url = Constants.StaffFeatures.VIEW_DETAIL_ORDER_CONTROLLER + "?OrderID=" + orderId;
                    }
                } else {
                    request.setAttribute("EGG_ERROR", "The total number of male and female nestlings must not exceed the number of available eggs");
                    url = Constants.StaffFeatures.NEW_NOTE_CONTROLLER + "?orderId=" + orderId;
                }
            } else {
                url = Constants.StaffFeatures.VIEW_DETAIL_ORDER_CONTROLLER + "?OrderID=" + orderId;
            }
        } catch (Exception e) {
            log(e.getMessage());
        } finally {
            response.sendRedirect(url);
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
