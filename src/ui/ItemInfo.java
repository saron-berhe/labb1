package ui;

public class ItemInfo {
    private int itemId;
    private String name;
    private double price;

    public ItemInfo(int itemId, String name, double price) {
        this.itemId = itemId;
        this.name = name;
        this.price = price;
    }

    public String getName() {return name;}

    public double getPrice() {return price;}

    public int getItemId() {return itemId;}

    public void setName(String name) {this.name = name;}

    public void setPrice(double price) {this.price = price;}

    public void setItemId(int itemId) {this.itemId = itemId;}
}
