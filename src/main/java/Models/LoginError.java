
package Models;


public class LoginError {

    private String emptyEmail;
    private String emptyPassword;
    private String wrongEmail;
    private String wrongPassword;

    public LoginError() {
    }

    public LoginError(String emptyEmail, String emptyPassword, String wrongEmail, String wrongPassword) {
        this.emptyEmail = emptyEmail;
        this.emptyPassword = emptyPassword;
        this.wrongEmail = wrongEmail;
        this.wrongPassword = wrongPassword;
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

    
}
