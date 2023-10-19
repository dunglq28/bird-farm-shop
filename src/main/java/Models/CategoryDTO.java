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
public class CategoryDTO {

    private String CategoryID;
    private String Category_Name;

    public CategoryDTO(String CategoryID, String Category_Name) {
        this.CategoryID = CategoryID;
        this.Category_Name = Category_Name;
    }

    public String getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(String CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getCategory_Name() {
        return Category_Name;
    }

    public void setCategory_Name(String Category_Name) {
        this.Category_Name = Category_Name;
    }
    
    

}
