/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author hj
 */
public class Service_Price_ListDTO {
    private int service_Price_List_ID;
    private int serviceID;
    private String serviceName;
    private int minimum_number_of_eggs;
    private int maximum_number_of_eggs;
    private float servicePrice;
    private String unitPrice;

    public Service_Price_ListDTO() {
    }

    public Service_Price_ListDTO(int service_Price_List_ID, int serviceID, String serviceName, int minimum_number_of_eggs, int maximum_number_of_eggs, float servicePrice, String unitPrice) {
        this.service_Price_List_ID = service_Price_List_ID;
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.minimum_number_of_eggs = minimum_number_of_eggs;
        this.maximum_number_of_eggs = maximum_number_of_eggs;
        this.servicePrice = servicePrice;
        this.unitPrice = unitPrice;
    }

 

    public int getService_Price_List_ID() {
        return service_Price_List_ID;
    }

    public void setService_Price_List_ID(int service_Price_List_ID) {
        this.service_Price_List_ID = service_Price_List_ID;
    }
    
    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public int getMinimum_number_of_eggs() {
        return minimum_number_of_eggs;
    }

    public void setMinimum_number_of_eggs(int minimum_number_of_eggs) {
        this.minimum_number_of_eggs = minimum_number_of_eggs;
    }

    public int getMaximum_number_of_eggs() {
        return maximum_number_of_eggs;
    }

    public void setMaximum_number_of_eggs(int maximum_number_of_eggs) {
        this.maximum_number_of_eggs = maximum_number_of_eggs;
    }

    public float getServicePrice() {
        return servicePrice;
    }

    public void setServicePrice(float servicePrice) {
        this.servicePrice = servicePrice;
    }

    public String getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice;
    }
    
    
}
