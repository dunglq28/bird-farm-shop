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

    private int serviceID;
    private String serviceName;
    private float minimum_number_of_eggs;
    private float maximum_number_of_eggs;
    private float servicePrice;
    private String unitPrice;

    public Service_Price_ListDTO() {
    }

    public Service_Price_ListDTO(int serviceID, String serviceName, float minimum_number_of_eggs, float maximum_number_of_eggs, float servicePrice, String unitPrice) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.minimum_number_of_eggs = minimum_number_of_eggs;
        this.maximum_number_of_eggs = maximum_number_of_eggs;
        this.servicePrice = servicePrice;
        this.unitPrice = unitPrice;
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

    public float getMinimum_number_of_eggs() {
        return minimum_number_of_eggs;
    }

    public void setMinimum_number_of_eggs(float minimum_number_of_eggs) {
        this.minimum_number_of_eggs = minimum_number_of_eggs;
    }

    public float getMaximum_number_of_eggs() {
        return maximum_number_of_eggs;
    }

    public void setMaximum_number_of_eggs(float maximum_number_of_eggs) {
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
