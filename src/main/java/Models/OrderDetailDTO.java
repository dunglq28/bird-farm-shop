/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Utils.FormatCurrency;

/**
 *
 * @author hj
 */
public class OrderDetailDTO {

    private String orderID;
    private int serviceID;
    private String birdID;
    private String bird_Nest_ID;
    private String bird_name;
    private String cate_name;
    private String bird_image;
    private String bird_color;
    private String bird_age;
    private float price;
    private String priceFormat;
    private int quantity_Buy;
    private String status;

    public OrderDetailDTO(String orderID, int serviceID, String birdID, String bird_Nest_ID, float price, int quantity_Buy, String status) {
        this.orderID = orderID;
        this.serviceID = serviceID;
        this.birdID = birdID;
        this.bird_Nest_ID = bird_Nest_ID;
        this.price = price;
        this.quantity_Buy = quantity_Buy;
        this.status = status;
    }

    public OrderDetailDTO(String bird_name, String cate_name, String bird_image, String bird_color, String bird_age, float price, int quantity_Buy) {
        this.bird_name = bird_name;
        this.cate_name = cate_name;
        this.bird_image = bird_image;
        this.bird_color = bird_color;
        this.bird_age = bird_age;
        this.price = price;
        this.quantity_Buy = quantity_Buy;
    }
    
    public String getPriceFormat() {
        return FormatCurrency.FormatPrice(this.price);
    }

    public void setPriceFormat(String priceFormat) {
        this.priceFormat = priceFormat;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public String getBirdID() {
        return birdID;
    }

    public void setBirdID(String birdID) {
        this.birdID = birdID;
    }

    public String getBird_Nest_ID() {
        return bird_Nest_ID;
    }

    public void setBird_Nest_ID(String bird_Nest_ID) {
        this.bird_Nest_ID = bird_Nest_ID;
    }

    public String getBird_name() {
        return bird_name;
    }

    public void setBird_name(String bird_name) {
        this.bird_name = bird_name;
    }

    public String getCate_name() {
        return cate_name;
    }

    public void setCate_name(String cate_name) {
        this.cate_name = cate_name;
    }

    public String getBird_image() {
        return bird_image;
    }

    public void setBird_image(String bird_image) {
        this.bird_image = bird_image;
    }

    public String getBird_color() {
        return bird_color;
    }

    public void setBird_color(String bird_color) {
        this.bird_color = bird_color;
    }

    public String getBird_age() {
        return bird_age;
    }

    public void setBird_age(String bird_age) {
        this.bird_age = bird_age;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity_Buy() {
        return quantity_Buy;
    }

    public void setQuantity_Buy(int quantity_Buy) {
        this.quantity_Buy = quantity_Buy;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    

}