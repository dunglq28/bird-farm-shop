/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Public;

import Cart.CartObj;
import Daos.BirdNestDetail_TrackingDAO;
import Daos.Bird_Nest_TrackingDAO;
import Daos.ProductDAO;
import Daos.OrderDAO;
import Daos.OrderDetailDAO;
import Models.AccountDTO;
import Models.BirdNestDetail_TrackingDTO;
import Models.Bird_Nest_TrackingDTO;
import Models.CustomerDTO;
import Models.OrderDTO;
import Models.OrderDetailDTO;
import Models.ProductDTO;
import Object.Products;
import Utils.MyAppConstants;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
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
@WebServlet(name = "CreateOrder", urlPatterns = {"/CreateOrder"})
public class CreateOrderServlet extends HttpServlet {

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

        String vnPayStatus = request.getParameter("vnp_TransactionStatus");
        String url = MyAppConstants.PublicFeatures.FAILURE_ORDER_CONTROLLER;
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        try {
            String paymentMethod = (String) session.getAttribute("PAYMENT_METHOD");
            CartObj cart = (CartObj) session.getAttribute("BIRD_CART");
            ProductDTO maleBird = (ProductDTO) session.getAttribute("MALE_BIRD_CHOOSE");
            ProductDTO femaleBird = (ProductDTO) session.getAttribute("FEMALE_BIRD_CHOOSE");

            int serviceID = Integer.parseInt((String) session.getAttribute("SERVICE_ID"));

            if (cart == null && maleBird == null && femaleBird == null && session.getAttribute("OLD_ORDER_ID") == null) {
                url = "cart";
            } else {
                String shippingMethod = (String) session.getAttribute("SHIPPING_METHOD");

                AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
                CustomerDTO customer = (CustomerDTO) session.getAttribute("CUSTOMER");
                int temp = (Integer) session.getAttribute("SHIPPING_CASH");

                float shippingCash = (float) temp;
                String totalOrder = (String) session.getAttribute("TOTAL_ORDER");
                long millis = System.currentTimeMillis();
                java.sql.Date orderDate = new java.sql.Date(millis);

                if (paymentMethod.equals("COD") || paymentMethod.equals("VNPAY") && vnPayStatus.equals("00")) {
                    //Initialize the necessary variables
                    OrderDAO orderdao = new OrderDAO();
                    OrderDTO newOrder;
                    String orderID = null;
                    ProductDAO birdDao = new ProductDAO();
                    ProductDTO pro = new ProductDTO();
                    OrderDetailDAO odDao = new OrderDetailDAO();
                    Bird_Nest_TrackingDAO bndao = new Bird_Nest_TrackingDAO();
                    OrderDetailDTO odDto;
                    Bird_Nest_TrackingDTO bndto;
                    int quantityAvaUpdate;
                    int quantitySold;
                    String bnId;
                    boolean flag = true;
                    switch (serviceID) {
                        case 1:
                            orderID = orderdao.createOrderID();
                            //Create a detail order to buy birds and bird's nests
                            for (String key : cart.getItems().keySet()) {
                                odDto = new OrderDetailDTO(orderID, key,
                                        Float.parseFloat(cart.getItems().get(key).getPriceDiscount()),
                                        cart.getItems().get(key).getQuantityBuy());

                                pro = birdDao.getAllQuantityByProductID(key);
                                //Subtract the quantity of products available
                                quantityAvaUpdate = pro.getQuantity_Available() - cart.getItems().get(key).getQuantityBuy();

                                //Add the sold quantity of the product
                                quantitySold = pro.getQuantity_Sold() + cart.getItems().get(key).getQuantityBuy();
                                birdDao.updateQuantityAfterOrder(quantityAvaUpdate, pro.getQuantity_MaleBird(), quantitySold, key);
                                if (flag) {
                                    //Create an order to buy birds and bird's nests
                                    newOrder = new OrderDTO(orderID, serviceID, account.getAccountID(), null, shippingMethod, customer.getAddress(), customer.getCity(),
                                            customer.getPhone_Number(), orderDate, null, 0, shippingCash, 0, Float.parseFloat(totalOrder), paymentMethod, "Wait for confirmation");
                                    orderdao.createOrder(newOrder);
                                    flag = false;
                                }
                                odDao.createOrderDetail(odDto);
                            }

                            //remove cart
                            cart.removeAllBird();
                            session.removeAttribute("BIRD_CART");
                            session.setAttribute("CART_QUANTITY_PRODUCT", cart.getItemsLength());
                            break;
                        case 2:
                            orderID = orderdao.createOrderID();
                            //Take all quantity of product to handle
                            pro = birdDao.getAllQuantityByProductID(maleBird.getProductID());
                            //Subtract the quantity of male bird available
                            quantityAvaUpdate = pro.getQuantity_Available() - 1;

                            // update quantityBuy and quantitySold of male bird
                            birdDao.updateQuantityAfterOrder(quantityAvaUpdate, pro.getQuantity_AreMating() + 1, pro.getQuantity_Sold(), pro.getProductID());

                            //Same with male birds
                            pro = birdDao.getAllQuantityByProductID(femaleBird.getProductID());
                            quantityAvaUpdate = pro.getQuantity_Available() - 1;

                            birdDao.updateQuantityAfterOrder(quantityAvaUpdate, pro.getQuantity_AreMating() + 1, pro.getQuantity_Sold(), pro.getProductID());

                            //Create an order for bird matching service
                            newOrder = new OrderDTO(orderID, serviceID, account.getAccountID(), null, null, customer.getAddress(), customer.getCity(),
                                    customer.getPhone_Number(), orderDate, null, 0, 0, Float.parseFloat(totalOrder), 0, paymentMethod, "Wait for confirmation");
                            orderdao.createOrder(newOrder);
                            // Create a detail order for bird matching service with quantityBuy of product is 0
                            odDto = new OrderDetailDTO(orderID, maleBird.getProductID(), maleBird.getPriceDiscount(), 0);
                            odDao.createOrderDetail(odDto);
                            odDto = new OrderDetailDTO(orderID, femaleBird.getProductID(), femaleBird.getPriceDiscount(), 0);
                            odDao.createOrderDetail(odDto);

                            bnId = bndao.createBirdNestID();
                            bndto = new Bird_Nest_TrackingDTO(bnId, orderID, null, 0, 0, 0,
                                    account.getAccountID(), serviceID,
                                    orderDate, orderDate, "Wait for confirmation");
                            bndao.createBirdNestTracking(bndto);
                            // remove session of male and female bird
                            session.removeAttribute("MALE_BIRD_CHOOSE");
                            session.removeAttribute("FEMALE_BIRD_CHOOSE");
                            break;
                        case 0: // Final payment of bird matching service
                            String oldOrderID = (String) session.getAttribute("OLD_ORDER_ID");
                            // update order of this service
                            orderdao.UpdateOrder(oldOrderID, shippingMethod, shippingCash, Float.parseFloat(totalOrder), paymentMethod);
                            //update final status of tracking match bird
//                            long millis = System.currentTimeMillis();
                            bndao.updateStatusBirdNestTracking(oldOrderID, "Payment Success", orderDate);
                            orderID = oldOrderID;

                            //Take all quantity of product to handle
                            maleBird = birdDao.getAllQuantityByProductID((String) session.getAttribute("MALE_BIRD_ID"));
                            // Take the matching birds and bring them to the shop to sell
                            quantityAvaUpdate = maleBird.getQuantity_Available() + 1;

                            birdDao.updateQuantityAfterOrder(quantityAvaUpdate, maleBird.getQuantity_AreMating() - 1, maleBird.getQuantity_Sold(), maleBird.getProductID());

                            // same as male bird
                            femaleBird = birdDao.getAllQuantityByProductID((String) session.getAttribute("FEMALE_BIRD_ID"));
                            quantityAvaUpdate = femaleBird.getQuantity_Available() + 1;

                            birdDao.updateQuantityAfterOrder(quantityAvaUpdate, femaleBird.getQuantity_AreMating() - 1, femaleBird.getQuantity_Sold(), femaleBird.getProductID());

                            // remove session of final payment
                            session.removeAttribute("OLD_ORDER_ID");
                            session.removeAttribute("DEPOSIT_PRICE");
                            session.removeAttribute("PRICE_MALE_BABY_BIRD");
                            session.removeAttribute("PRICE_FEMALE_BABY_BIRD");
                            session.removeAttribute("FEMALE_BIRD_ID");
                            session.removeAttribute("MALE_BIRD_ID");
                            session.setAttribute("SERVICE_ID", 2);

                            break;
                    }
                    session.setAttribute("ORDER_ID", orderID);
                    url = MyAppConstants.PublicFeatures.SUCCESS_ORDER_CONTROLLER;
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
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
