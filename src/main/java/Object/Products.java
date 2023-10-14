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

    private String name;
    private String cate_name;
    private String age;
    private String color;
    private String gender;
    private String image;
    private int quantityAvailable;
    private int quantityBuy;
    private int quantitySold;
    private float price;
    private String priceFormat;
    private float discount;

    public Products() {
    }
    
    

    public Products(String name, String cate_name, String age, String color, String gender, String image, int quantityAvailable, int quantityBuy, int quantitySold, float price, float discount) {
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

    public Products(String name, String cate_name, String image, int quantityAvailable, int quantityBuy, int quantitySold, float price, float discount) {
        this.name = name;
        this.cate_name = cate_name;
        this.image = image;
        this.quantityAvailable = quantityAvailable;
        this.quantityBuy = quantityBuy;
        this.quantitySold = quantitySold;
        this.price = price;
        this.discount = discount;
    }

    public Products(String name, String cate_name, String age, String color, String gender, String image, int quantityBuy, float price) {
        this.name = name;
        this.cate_name = cate_name;
        this.age = age;
        this.color = color;
        this.gender = gender;
        this.image = image;
        this.quantityBuy = quantityBuy;
        this.price = price;
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

    public String getPriceFormat() {
        return FormatCurrency.FormatPrice(this.price);
    }

    public void setPriceFormat(String priceFormat) {
        this.priceFormat = priceFormat;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

}
