/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Daos.Service_Price_ListDAO;
import Models.Service_Price_ListDTO;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author hj
 */
public class CalculateServicePrice {

    public static float CalculateServicePrice(int serviceID, int quantity_egg, float price_egg) {
        try {
            if (serviceID == 2) {
                Service_Price_ListDAO dao = new Service_Price_ListDAO();
                List<Service_Price_ListDTO> servicePrice = dao.getServicePriceByServiceID(serviceID);

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return 0;
    }
}
