package Cart;

import Object.Products;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;

public class CartObj {

    private Map<String, Products> items;

    public Map<String, Products> getItems() {
        return items;
    }

    public int getItemsLength() {
        return items.size();
    }



    public void addItemToCart(String sku, Products product) { // (String sku, int quantity)
        if (sku == null) {
            return;
        }
        if (sku.trim().isEmpty()) {
            return;
        }
        if (this.items == null) {
            this.items = new HashMap<>();
        }
         if (this.items.containsKey(sku)) {
            int quantityBuy = this.items.get(sku).getQuantityBuy() + product.getQuantityBuy();
            product.setQuantityBuy(quantityBuy);
        }
        // 3. Update items
        this.items.put(sku, product);
    }
    
    public void updateQuantityBuy(String sku, int quantityBuy) { 
        if (sku == null) {
            return;
        }
        if (sku.trim().isEmpty()) {
            return;
        }
        if (this.items == null) {
            this.items = new HashMap<>();
        }
        if (this.items.containsKey(sku)) {
            this.items.get(sku).setQuantityBuy(quantityBuy);
        }
    }

    public void removeBirdFromCart(String sku) { // remove All -> ass: bỏ based on quantity (String sku, int quantity)
        // 1. Check existed items - ngăn chứa đồ
        if (this.items == null) {
            return;
        }
        // 2. Check existed item
        if (this.items.containsKey(sku)) {
            // 3. Remove item from items
//            this.items.get(sku) = quantity;
            if (this.items.isEmpty()) { // Kinh nghiệm code thầy KhanhKT
                this.items = null;
            } else {
                this.items.remove(sku);
            }
        }
    }
    
    public void removeAllBird() { // remove All -> ass: bỏ based on quantity (String sku, int quantity)
        // 1. Check existed items - ngăn chứa đồ
        if (this.items == null) {
            return;
        }
        
        this.items.clear();
        
    }

}
