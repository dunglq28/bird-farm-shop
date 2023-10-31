package Models;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 *
 * @author hj
 */
public class OrderDTO {

    private String orderID;
    private int serviceID;
    private String serviceName;
    private String accountID;
    private String accountName;
    private String staffID;
    private String form_Receipt;
    private String shipAddress;
    private String shipCity;
    private String phoneNumber;
    private Date orderDate;
    private Date orderDateFormat;
    private Date receiptDate;
    private float discount;
    private float delivery_charges;
    private float deposit_Price;
    private float total_Order;
    private float total_order_final;
    private String payBy;
    private String status;

    public OrderDTO() {
    }

    public OrderDTO(String orderID, int serviceID, String accountID, String staffID, String form_Receipt, String shipAddress, String shipCity, String phoneNumber, Date orderDate, Date receiptDate, float discount, float delivery_charges, float deposit_Price, float total_Order, String payBy, String status) {
        this.orderID = orderID;
        this.serviceID = serviceID;
        this.accountID = accountID;
        this.staffID = staffID;
        this.form_Receipt = form_Receipt;
        this.shipAddress = shipAddress;
        this.shipCity = shipCity;
        this.phoneNumber = phoneNumber;
        this.orderDate = orderDate;
        this.receiptDate = receiptDate;
        this.discount = discount;
        this.delivery_charges = delivery_charges;
        this.total_Order = total_Order;
        this.deposit_Price = deposit_Price;
        this.payBy = payBy;
        this.status = status;
    }

    public OrderDTO(String orderID, int serviceID, String serviceName, String form_Receipt, Date orderDate, float discount, float delivery_charges, float deposit_Price, float total_Order, String payBy, String status) {
        this.orderID = orderID;
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.form_Receipt = form_Receipt;
        this.orderDate = orderDate;
        this.discount = discount;
        this.delivery_charges = delivery_charges;
        this.deposit_Price = deposit_Price;
        this.total_Order = total_Order;
        this.payBy = payBy;
        this.status = status;
    }

    public OrderDTO(String orderID, String serviceName, String accountName, String form_Receipt, Date orderDate, float total_Order,
            String payBy, String status, float discount, float delivery_charges) {
        this.orderID = orderID;
        this.serviceName = serviceName;
        this.accountName = accountName;
        this.form_Receipt = form_Receipt;
        this.orderDate = orderDate;
        this.total_Order = total_Order;
        this.payBy = payBy;
        this.status = status;
        this.discount = discount;
        this.delivery_charges = delivery_charges;
    }
    
      public OrderDTO(String orderID, String serviceName, String accountName, String form_Receipt, Date orderDate, float total_Order,
            String payBy, String status, float discount, float delivery_charges, String StaffID) {
        this.orderID = orderID;
        this.serviceName = serviceName;
        this.accountName = accountName;
        this.form_Receipt = form_Receipt;
        this.orderDate = orderDate;
        this.total_Order = total_Order;
        this.payBy = payBy;
        this.status = status;
        this.discount = discount;
        this.delivery_charges = delivery_charges;
        this.staffID = StaffID;
    }

    public OrderDTO(String orderID, int serviceID, String accountName, String staffID, String form_Receipt, String shipAddress,
            String shipCity, String phoneNumber, Date orderDate, float delivery_charges, float deposit_Price, float total_Order, String status) {
        this.orderID = orderID;
        this.serviceID = serviceID;
        this.accountName = accountName;
        this.staffID = staffID;
        this.form_Receipt = form_Receipt;
        this.shipAddress = shipAddress;
        this.shipCity = shipCity;
        this.phoneNumber = phoneNumber;
        this.orderDate = orderDate;
        this.delivery_charges = delivery_charges;
        this.deposit_Price = deposit_Price;
        this.total_Order = total_Order;
        this.status = status;
    }

    public OrderDTO(String orderID, String staffID, String status) {
        this.orderID = orderID;
        this.staffID = staffID;
        this.status = status;
    }

    public String getOrderDateFormat() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/YYYY");
        return sdf.format(this.orderDate);
    }

    public void setOrderDateFormat(Date orderDateFormat) {
        this.orderDateFormat = orderDateFormat;
    }

    public float getTotal_order_final() {
        return this.total_Order - this.total_Order * this.discount + this.delivery_charges;
    }

    public void setTotal_order_final(float total_order_final) {
        this.total_order_final = total_order_final;
    }

    public float getDelivery_charges() {
        return delivery_charges;
    }

    public void setDelivery_charges(float delivery_charges) {
        this.delivery_charges = delivery_charges;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    public String getForm_Receipt() {
        return form_Receipt;
    }

    public void setForm_Receipt(String form_Receipt) {
        this.form_Receipt = form_Receipt;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public String getShipCity() {
        return shipCity;
    }

    public void setShipCity(String shipCity) {
        this.shipCity = shipCity;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getReceiptDate() {
        return receiptDate;
    }

    public void setReceiptDate(Date receiptDate) {
        this.receiptDate = receiptDate;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public float getDeposit_Price() {
        return deposit_Price;
    }

    public void setDeposit_Price(float deposit_Price) {
        this.deposit_Price = deposit_Price;
    }

    public float getTotal_Order() {
        return total_Order;
    }

    public void setTotal_Order(float total_Order) {
        this.total_Order = total_Order;
    }

    public String getPayBy() {
        return payBy;
    }

    public void setPayBy(String payBy) {
        this.payBy = payBy;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}



