package bo;

import db.ItemDB;
import java.util.Collection;

public class Item {
    private int itemId;
    private String name;
    private double price;

    static public Collection searchItems(String group) {
        return ItemDB.searchItems(group);
    }

    protected Item(int itemId, String name, double price) {
        this.itemId = itemId;
        this.name = name;
        this.price = price;
    }

    public int getItemId() {return itemId;}

    public void setItemId(int itemId) {this.itemId = itemId;}

    public String getName() {return name;}

    public void setName(String name) {this.name = name;}

    public double getPrice() {return price;}

    public void setPrice(double price) {this.price = price;}
}
