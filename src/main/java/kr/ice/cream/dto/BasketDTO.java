package kr.ice.cream.dto;

/**
 * Created by Administrator on 2015-07-13.
 */
public class BasketDTO {

    private int srl;
    private int customersrl;
    private int itemsrl;
    private int amount;
    private String inputdate;
    private int status;

    public int getSrl() {
        return srl;
    }

    public void setSrl(int srl) {
        this.srl = srl;
    }

    public int getCustomersrl() {
        return customersrl;
    }

    public void setCustomersrl(int customersrl) {
        this.customersrl = customersrl;
    }

    public int getItemsrl() {
        return itemsrl;
    }

    public void setItemsrl(int itemsrl) {
        this.itemsrl = itemsrl;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getInputdate() {
        return inputdate;
    }

    public void setInputdate(String inputdate) {
        this.inputdate = inputdate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "BasketDTO{" +
                "srl=" + srl +
                ", customersrl=" + customersrl +
                ", itemsrl=" + itemsrl +
                ", amount=" + amount +
                ", inputdate='" + inputdate + '\'' +
                ", status=" + status +
                '}';
    }
}
