package Obj;

import Models.BirdsDTO;
import java.util.HashMap;
import java.util.Map;

public class Birds {
    private Map<String, BirdsDTO> items;

    public Map<String, BirdsDTO> getItems() {
        return items;
    }

    BirdsDTO dto = new BirdsDTO();
    
    public void addItemToCart(String BirdName, int quantityBuy, float price, String BirdID, String Image) { 
        if (BirdID == null) {
            return;
        }
        if (BirdID.trim().isEmpty()) {
            return;
        }
        if (this.items == null) {
            this.items = new HashMap<>();
        }
        if (this.items.containsKey(BirdID)) {
            quantityBuy = this.items.get(BirdID).getQuantiry() + quantityBuy;
        }
        dto.setQuantiry(quantityBuy);
        this.items.put(BirdID, dto);
    }
}
