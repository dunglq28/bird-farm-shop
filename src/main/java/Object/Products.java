/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Object;

import Utils.FormatCurrency;

/**
 *
 * @author hj
 */
public class Products {

    private String productID;
    private String name;
    private String cate_name;
    private String dad_Bird_ID;
    private String mom_Bird_ID;
    private String age;
    private String color;
    private String gender;
    private String image;
    private int quantity_MaleBird;
    private int quantity_FemaleBird;
    private int quantityAvailable;
    private int quantityBuy;
    private int quantitySold;
    private float price;
    private String priceDiscount;
    private float discount;

    public Products() {
    }

    public Products(String productID, String name, String cate_name, String dad_Bird_ID, String mom_Bird_ID, String image,
            int quantityAvailable, int quantityBuy, int quantitySold, float price, float discount) {
        this.productID = productID;
        this.name = name;
        this.cate_name = cate_name;
        this.dad_Bird_ID = dad_Bird_ID;
        this.mom_Bird_ID = mom_Bird_ID;
        this.image = image;
        this.quantityAvailable = quantityAvailable;
        this.quantityBuy = quantityBuy;
        this.quantitySold = quantitySold;
        this.price = price;
        this.discount = discount;
    }

    public Products(String productID, String gender, float price) {
        this.productID = productID;
        this.gender = gender;
        this.price = price;
    }
    
    public Products(String productID, String name, String cate_name, String age, String color, String gender, String image, int quantityAvailable, int quantityBuy, int quantitySold, float price, float discount) {
        this.productID = productID;
        this.name = name;
        this.cate_name = cate_name;
        this.age = age;
        this.color = color;
        this.gender = gender;
        this.image = image;
        this.quantityAvailable = quantityAvailable;
        this.quantityBuy = quantityBuy;
        this.quantitySold = quantitySold;
        this.price = price;
        this.discount = discount;
    }

    public Products(String name, String cate_name, String image, int quantityAvailable, int quantity_MaleBird, int quantity_FemaleBird,
            int quantityBuy, int quantitySold, float price, float discount) {
        this.name = name;
        this.cate_name = cate_name;
        this.image = image;
        this.quantityAvailable = quantityAvailable;
        this.quantity_MaleBird = quantity_MaleBird;
        this.quantity_FemaleBird = quantity_FemaleBird;
        this.quantityBuy = quantityBuy;
        this.quantitySold = quantitySold;
        this.price = price;
        this.discount = discount;
    }

    public Products(String name, String cate_name, String age, String color, String gender, String image, int quantityBuy,
            int quantity_MaleBird, int quantity_FemaleBird, float price) {
        this.name = name;
        this.cate_name = cate_name;
        this.age = age;
        this.color = color;
        this.gender = gender;
        this.image = image;
        this.quantityBuy = quantityBuy;
        this.quantity_MaleBird = quantity_MaleBird;
        this.quantity_FemaleBird = quantity_FemaleBird;
        this.price = price;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCate_name() {
        return cate_name;
    }

    public void setCate_name(String cate_name) {
        this.cate_name = cate_name;
    }

    public String getDad_Bird_ID() {
        return dad_Bird_ID;
    }

    public void setDad_Bird_ID(String dad_Bird_ID) {
        this.dad_Bird_ID = dad_Bird_ID;
    }

    public String getMom_Bird_ID() {
        return mom_Bird_ID;
    }

    public void setMom_Bird_ID(String mom_Bird_ID) {
        this.mom_Bird_ID = mom_Bird_ID;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity_MaleBird() {
        return quantity_MaleBird;
    }

    public void setQuantity_MaleBird(int quantity_MaleBird) {
        this.quantity_MaleBird = quantity_MaleBird;
    }

    public int getQuantity_FemaleBird() {
        return quantity_FemaleBird;
    }

    public void setQuantity_FemaleBird(int quantity_FemaleBird) {
        this.quantity_FemaleBird = quantity_FemaleBird;
    }

    public int getQuantityAvailable() {
        return quantityAvailable;
    }

    public void setQuantityAvailable(int quantityAvailable) {
        this.quantityAvailable = quantityAvailable;
    }

    public int getQuantityBuy() {
        return quantityBuy;
    }

    public void setQuantityBuy(int quantityBuy) {
        this.quantityBuy = quantityBuy;
    }

    public int getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(int quantitySold) {
        this.quantitySold = quantitySold;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getPriceDiscount() {
        return String.valueOf(this.price - this.price * this.discount);
    }

    public void setPriceDiscount(String priceDiscount) {
        this.priceDiscount = priceDiscount;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

}
