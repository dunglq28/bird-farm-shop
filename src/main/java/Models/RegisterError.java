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
public class RegisterError {
    private String emptyEmail;
    private String wrongEmail;
    private String isExistEmail;
    private String emptyVerification;
    private String wrongVerification;
    private String emptyPassword;
    private String wrongPassword;
    private String confirmError;
    private String emptyFullName;

    public RegisterError() {
    }

    public RegisterError(String emptyEmail, String wrongEmail, String isExistEmail, String emptyVerification, String wrongVerification, String emptyPassword, String wrongPassword, String confirmError, String emptyFullName) {
        this.emptyEmail = emptyEmail;
        this.wrongEmail = wrongEmail;
        this.isExistEmail = isExistEmail;
        this.emptyVerification = emptyVerification;
        this.wrongVerification = wrongVerification;
        this.emptyPassword = emptyPassword;
        this.wrongPassword = wrongPassword;
        this.confirmError = confirmError;
        this.emptyFullName = emptyFullName;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

    public String getEmptyEmail() {
        return emptyEmail;
    }

    public void setEmptyEmail(String emptyEmail) {
        this.emptyEmail = emptyEmail;
    }

    public String getWrongEmail() {
        return wrongEmail;
    }

    public void setWrongEmail(String wrongEmail) {
        this.wrongEmail = wrongEmail;
    }

    public String getIsExistEmail() {
        return isExistEmail;
    }

    public void setIsExistEmail(String isExistEmail) {
        this.isExistEmail = isExistEmail;
    }

    public String getEmptyVerification() {
        return emptyVerification;
    }

    public void setEmptyVerification(String emptyVerification) {
        this.emptyVerification = emptyVerification;
    }

    public String getWrongVerification() {
        return wrongVerification;
    }

    public void setWrongVerification(String wrongVerification) {
        this.wrongVerification = wrongVerification;
    }

    public String getEmptyPassword() {
        return emptyPassword;
    }

    public void setEmptyPassword(String emptyPassword) {
        this.emptyPassword = emptyPassword;
    }

    public String getWrongPassword() {
        return wrongPassword;
    }

    public void setWrongPassword(String wrongPassword) {
        this.wrongPassword = wrongPassword;
    }

    public String getEmptyFullName() {
        return emptyFullName;
    }

    public void setEmptyFullName(String emptyFullName) {
        this.emptyFullName = emptyFullName;
    }

    
    

}
