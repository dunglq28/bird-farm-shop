/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Public;

import Daos.CategoryDAO;
import Daos.ProductDAO;
import Daos.Service_Price_ListDAO;
import Models.AccountDTO;
import Models.CustomerDTO;
import Models.ProductDTO;
import Models.Service_Price_ListDTO;
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
@WebServlet(name = "MatchBirdAvailable", urlPatterns = {"/MatchBirdAvailable"})
public class MatchBirdAvailableServlet extends HttpServlet {

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
        String url = MyAppConstants.CustomerFeatures.SERVICE_OPTION_TWO_PAGE;
        String cateChoose = request.getParameter("txtCateID");
        String maleBirdIDChoose = request.getParameter("txtMaleBirdID");
        String femaleBirdIDChoose = request.getParameter("txtFemaleBirdID");
        String optionChoose = request.getParameter("txtOptionChoose");
        HttpSession session = request.getSession();

        try {
            AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
            CustomerDTO customer = (CustomerDTO) session.getAttribute("CUSTOMER");
            int serviceID = Integer.parseInt((String) session.getAttribute("SERVICE_ID"));
            if (account == null || customer == null) {
                url = MyAppConstants.PublicFeatures.CHECK_LOGIN_CONTROLLER;
            }
            request.setAttribute("OPTION_CHOOSE", optionChoose);
            session.setAttribute("OPTION_CHOOSE", optionChoose);

            Service_Price_ListDAO dao = new Service_Price_ListDAO();
            if (session.getAttribute("SERVICE_PRICE") == null) {
                List<Service_Price_ListDTO> dto = dao.getServicePriceByServiceID(serviceID);
                session.setAttribute("SERVICE_PRICE", dto.get(0).getServicePrice());
            }

            ProductDAO proDao = new ProductDAO();
            CategoryDAO cateDao = new CategoryDAO();
            if (session.getAttribute("ALL_CATE") == null) {
                session.setAttribute("ALL_CATE", cateDao.getAllCate());
            }
            List<ProductDTO> maleBirdList = null;
            List<ProductDTO> femaleBirdList = null;

            if (cateChoose != null && session.getAttribute("CATE_CHOOSE_HISTORY") != cateChoose) {
                session.setAttribute("CATE_CHOOSE_HISTORY", cateChoose);

                maleBirdList = proDao.getBirdByGender("Male", Integer.parseInt(cateChoose));
                session.setAttribute("MALE_BIRD_HISTORY", maleBirdList);

                femaleBirdList = proDao.getBirdByGender("Female", Integer.parseInt(cateChoose));
                session.setAttribute("FEMALE_BIRD_HISTORY", femaleBirdList);

            } else if (cateChoose != null && session.getAttribute("CATE_CHOOSE_HISTORY") == cateChoose) {
                maleBirdList = (List<ProductDTO>) session.getAttribute("MALE_BIRD_HISTORY");
                femaleBirdList = (List<ProductDTO>) session.getAttribute("FEMALE_BIRD_HISTORY");
            }

            if (maleBirdIDChoose != null) {
                for (ProductDTO birdMaleChoose : maleBirdList) {
                    if (birdMaleChoose.getProductID().equals(maleBirdIDChoose) && optionChoose.contains("without parent")) {
                        birdMaleChoose.setPrice(0);
                        session.setAttribute("MALE_BIRD_CHOOSE", birdMaleChoose);
                        request.setAttribute("MALE_BIRD_CHOOSE", birdMaleChoose);

                    } else if (birdMaleChoose.getProductID().equals(maleBirdIDChoose) && optionChoose.contains("with parent")) {
                        session.setAttribute("MALE_BIRD_CHOOSE", birdMaleChoose);
                        request.setAttribute("MALE_BIRD_CHOOSE", birdMaleChoose);
                    }
                }
            }

            if (femaleBirdIDChoose != null) {
                for (ProductDTO birdFemaleChoose : femaleBirdList) {
                    if (birdFemaleChoose.getProductID().equals(femaleBirdIDChoose) && optionChoose.contains("without parent")) {
                        birdFemaleChoose.setPrice(0);
                        session.setAttribute("FEMALE_BIRD_CHOOSE", birdFemaleChoose);
                        request.setAttribute("FEMALE_BIRD_CHOOSE", birdFemaleChoose);

                    } else if (birdFemaleChoose.getProductID().equals(femaleBirdIDChoose) && optionChoose.contains("with parent")) {
                        session.setAttribute("FEMALE_BIRD_CHOOSE", birdFemaleChoose);
                        request.setAttribute("FEMALE_BIRD_CHOOSE", birdFemaleChoose);
                    }
                }
            }

            request.setAttribute("CATE_CHOOSE", cateChoose);
            request.setAttribute("MALE_BIRD", maleBirdList);
            request.setAttribute("FEMALE_BIRD", femaleBirdList);

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
