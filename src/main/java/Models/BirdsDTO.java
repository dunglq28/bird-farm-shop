package Models;

import java.sql.Date;

public class BirdsDTO {
    private String BirdID;
    private int CategoryID;
    private String Age;
    private String Color;
    private String Gender;
    private String Image;
    private int Quantiry;
    private float Price;
    private String Characteristics;
    private String Detail;
    private Date Date_created;
    private int Discount;
    private boolean status;

    public BirdsDTO() {
    }

    public BirdsDTO(String BirdID, int CategoryID, String Age, String Color, String Gender, String Image, int Quantiry, float Price, String Characteristics, String Detail, Date Date_created, int Discount, boolean status) {
        this.BirdID = BirdID;
        this.CategoryID = CategoryID;
        this.Age = Age;
        this.Color = Color;
        this.Gender = Gender;
        this.Image = Image;
        this.Quantiry = Quantiry;
        this.Price = Price;
        this.Characteristics = Characteristics;
        this.Detail = Detail;
        this.Date_created = Date_created;
        this.Discount = Discount;
        this.status = status;
    }

    public String getBirdID() {
        return BirdID;
    }

    public void setBirdID(String BirdID) {
        this.BirdID = BirdID;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getAge() {
        return Age;
    }

    public void setAge(String Age) {
        this.Age = Age;
    }

    public String getColor() {
        return Color;
    }

    public void setColor(String Color) {
        this.Color = Color;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public int getQuantiry() {
        return Quantiry;
    }

    public void setQuantiry(int Quantiry) {
        this.Quantiry = Quantiry;
    }

    public float getPrice() {
        return Price;
    }

    public void setPrice(float Price) {
        this.Price = Price;
    }

    public String getCharacteristics() {
        return Characteristics;
    }

    public void setCharacteristics(String Characteristics) {
        this.Characteristics = Characteristics;
    }

    public String getDetail() {
        return Detail;
    }

    public void setDetail(String Detail) {
        this.Detail = Detail;
    }

    public Date getDate_created() {
        return Date_created;
    }

    public void setDate_created(Date Date_created) {
        this.Date_created = Date_created;
    }

    public int getDiscount() {
        return Discount;
    }

    public void setDiscount(int Discount) {
        this.Discount = Discount;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
}
