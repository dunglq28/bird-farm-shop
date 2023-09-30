package Models;

import Utils.FormatCurrency;
import java.sql.Date;

public class BirdDTO {
    private String birdID;
    private String bird_Name;
    private int categoryID;
    private String age;
    private String color;
    private String gender;
    private String image;
    private int quantiry;
    private float price;
    private String priceFormat;
    private String characteristics;
    private String detail;
    private Date date_created;
    private float discount;
    private String status;

    public BirdDTO() {
    }


    public BirdDTO(String bird_Name, String image, int quantiry, float price) {
        this.bird_Name = bird_Name;
        this.image = image;
        this.quantiry = quantiry;
        this.price = price;
    }


    

    public BirdDTO(String birdID, String bird_Name, int categoryID, String age, String color, String gender, String image, int quantiry, float price, String characteristics, String detail, Date date_created, float discount, String status) {
        this.birdID = birdID;
        this.bird_Name = bird_Name;
        this.categoryID = categoryID;
        this.age = age;
        this.color = color;
        this.gender = gender;
        this.image = image;
        this.quantiry = quantiry;
        this.price = price;
        this.characteristics = characteristics;
        this.detail = detail;
        this.date_created = date_created;
        this.discount = discount;
        this.status = status;
    }

    public BirdDTO(String birdID, String bird_Name, String image, float price, float discount, String status) {
        this.birdID = birdID;
        this.bird_Name = bird_Name;
        this.image = image;
        this.price = price;
        this.discount = discount;
        this.status = status;
    }

    public String getPriceFormat() {
        return FormatCurrency.FormatPrice(this.price);
    }

    public void setPriceFormat(String priceFormat) {
        this.priceFormat = priceFormat;
    }
    

    public String getBirdID() {
        return birdID;
    }

    public void setBirdID(String birdID) {
        this.birdID = birdID;
    }

    public String getBird_Name() {
        return bird_Name;
    }

    public void setBird_Name(String bird_Name) {
        this.bird_Name = bird_Name;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
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

    public int getQuantiry() {
        return quantiry;
    }

    public void setQuantiry(int quantiry) {
        this.quantiry = quantiry;
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
    
    
    

   
    
}
