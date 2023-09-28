package Models;

import java.sql.Date;

public class BirdDTO {
    private String birdID;
    private int categoryID;
    private String age;
    private String color;
    private String gender;
    private String image;
    private int quantiry;
    private float price;
    private String characteristics;
    private String detail;
    private Date date_created;
    private float discount;
    private boolean status;

    public BirdDTO() {
    }

    public BirdDTO(String birdID, int categoryID, String age, String color, String gender, String image, int quantiry, float price, String characteristics, String detail, Date date_created, float discount, boolean status) {
        this.birdID = birdID;
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

    public String getBirdID() {
        return birdID;
    }

    public void setBirdID(String birdID) {
        this.birdID = birdID;
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

  
    
}
