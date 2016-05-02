package kr.ice.cream.dto;

/**
 * Created by Administrator on 2015-07-28.
 */
public class OrderItem {

    private int amount;
    private int itemsrl;
    private String title;
    private int price;
    private String photo;

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getItemsrl() {
        return itemsrl;
    }

    public void setItemsrl(int itemsrl) {
        this.itemsrl = itemsrl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
