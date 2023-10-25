package Models;

import Utils.FormatCurrency;
import java.sql.Date;

public class ProductDTO {

    private String productID;
    private String product_Name;
    private int categoryID;
    private String category_Name;
    private int product_TypeID;
    private String dad_Bird_ID;
    private String mom_Bird_ID;
    private String age;
    private String color;
    private String gender;
    private String image;
    private int quantity_Available;
    private int quantity_AreMating;
    private int quantity_Sold;
    private float price;
    private String priceDiscount;
    private String characteristics;
    private String detail;
    private Date date_created;
    private float discount;
    private String status;

    public ProductDTO() {
    }

    public ProductDTO(int categoryID, String category_Name) {
        this.categoryID = categoryID;
        this.category_Name = category_Name;
    }

    public ProductDTO(String productID, String product_Name, int categoryID, String age, String color, String gender, String image, int quantity_Available, float price, String characteristics, String detail, Date date_created, float discount, String status) {
        this.productID = productID;
        this.product_Name = product_Name;
        this.categoryID = categoryID;
        this.age = age;
        this.color = color;
        this.gender = gender;
        this.image = image;
        this.quantity_Available = quantity_Available;
        this.price = price;
        this.characteristics = characteristics;
        this.detail = detail;
        this.date_created = date_created;
        this.discount = discount;
        this.status = status;
    }

    public ProductDTO(String productID, String product_Name, String age, String color, String gender, String image, int quantity_Available, int quantity_AreMating, int quantity_Sold, float price, float discount) {
        this.productID = productID;
        this.product_Name = product_Name;
        this.age = age;
        this.color = color;
        this.gender = gender;
        this.image = image;
        this.quantity_Available = quantity_Available;
        this.quantity_AreMating = quantity_AreMating;
        this.quantity_Sold = quantity_Sold;
        this.price = price;
        this.discount = discount;
    }

    public ProductDTO(String productID, String product_Name, String category_Name, int product_TypeID, String age, String color, String gender, String image, int quantity_Available, int quantity_Sold, float price, float discount, String status) {
        this.productID = productID;
        this.product_Name = product_Name;
        this.category_Name = category_Name;
        this.product_TypeID = product_TypeID;
        this.age = age;
        this.color = color;
        this.gender = gender;
        this.image = image;
        this.quantity_Available = quantity_Available;
        this.quantity_Sold = quantity_Sold;
        this.price = price;
        this.discount = discount;
        this.status = status;
    }

    public ProductDTO(String productID, String product_Name, int categoryID, String category_Name, int product_TypeID, String dad_Bird_ID, String mom_Bird_ID, String age, String color, String gender, String image, int quantity_Available, int quantity_Sold, float price, String characteristics, String detail, Date date_created, float discount, String status) {
        this.productID = productID;
        this.product_Name = product_Name;
        this.categoryID = categoryID;
        this.category_Name = category_Name;
        this.product_TypeID = product_TypeID;
        this.dad_Bird_ID = dad_Bird_ID;
        this.mom_Bird_ID = mom_Bird_ID;
        this.age = age;
        this.color = color;
        this.gender = gender;
        this.image = image;
        this.quantity_Available = quantity_Available;
        this.quantity_Sold = quantity_Sold;
        this.price = price;
        this.characteristics = characteristics;
        this.detail = detail;
        this.date_created = date_created;
        this.discount = discount;
        this.status = status;
    }

    public ProductDTO(String product_Name, String category_Name, String age, String color, String gender) {
        this.product_Name = product_Name;
        this.category_Name = category_Name;
        this.age = age;
        this.color = color;
        this.gender = gender;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProduct_Name() {
        return product_Name;
    }

    public void setProduct_Name(String product_Name) {
        this.product_Name = product_Name;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategory_Name() {
        return category_Name;
    }

    public void setCategory_Name(String category_Name) {
        this.category_Name = category_Name;
    }

    public int getProduct_TypeID() {
        return product_TypeID;
    }

    public void setProduct_TypeID(int product_TypeID) {
        this.product_TypeID = product_TypeID;
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

    public int getQuantity_Available() {
        return quantity_Available;
    }

    public void setQuantity_Available(int quantity_Available) {
        this.quantity_Available = quantity_Available;
    }

    public int getQuantity_AreMating() {
        return quantity_AreMating;
    }

    public void setQuantity_AreMating(int quantity_AreMating) {
        this.quantity_AreMating = quantity_AreMating;
    }

    public int getQuantity_Sold() {
        return quantity_Sold;
    }

    public void setQuantity_Sold(int quantity_Sold) {
        this.quantity_Sold = quantity_Sold;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getCharacteristics() {
        return characteristics;
    }

    public void setCharacteristics(String characteristics) {
        this.characteristics = characteristics;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public float getPriceDiscount() {
        return this.price - this.price * this.discount;
    }

    public void setPriceDiscount(String priceDiscount) {
        this.priceDiscount = priceDiscount;
    }

}
