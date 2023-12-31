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
public class LoginError {

    private String emptyEmail;
    private String emptyPassword;
    private String wrongEmail;
    private String wrongPassword;
    private String disableAccount;

    public LoginError() {
    }

    public LoginError(String emptyEmail, String emptyPassword, String wrongEmail, String wrongPassword, String disableAccount) {
        this.emptyEmail = emptyEmail;
        this.emptyPassword = emptyPassword;
        this.wrongEmail = wrongEmail;
        this.wrongPassword = wrongPassword;
        this.disableAccount = disableAccount;
    }

    public String getEmptyEmail() {
        return emptyEmail;
    }

    public void setEmptyEmail(String emptyEmail) {
        this.emptyEmail = emptyEmail;
    }

    public String getEmptyPassword() {
        return emptyPassword;
    }

    public void setEmptyPassword(String emptyPassword) {
        this.emptyPassword = emptyPassword;
    }

    public String getWrongEmail() {
        return wrongEmail;
    }

    public void setWrongEmail(String wrongEmail) {
        this.wrongEmail = wrongEmail;
    }

    public String getWrongPassword() {
        return wrongPassword;
    }

    public void setWrongPassword(String wrongPassword) {
        this.wrongPassword = wrongPassword;
    }

    public String getDisableAccount() {
        return disableAccount;
    }

    public void setDisableAccount(String disableAccount) {
        this.disableAccount = disableAccount;
    }

}
