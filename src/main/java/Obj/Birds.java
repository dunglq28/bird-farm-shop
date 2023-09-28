package Obj;

import Models.BirdDTO;
import java.util.HashMap;
import java.util.Map;

public class Birds {
    private Map<String, BirdDTO> items;

    public Map<String, BirdDTO> getItems() {
        return items;
    }

    BirdDTO dto = new BirdDTO();
    
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
