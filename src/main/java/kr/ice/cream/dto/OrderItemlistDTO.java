package kr.ice.cream.dto;

import java.util.List;

/**
 * Created by Administrator on 2015-07-28.
 */
public class OrderItemlistDTO {
    private OrdersDTO orders;
    private List<OrderItem> orderItemlist;

    public OrdersDTO getOrders() {
        return orders;
    }

    public void setOrders(OrdersDTO orders) {
        this.orders = orders;
    }

    public List<OrderItem> getOrderItemlist() {
        return orderItemlist;
    }

    public void setOrderItemlist(List<OrderItem> orderItemlist) {
        this.orderItemlist = orderItemlist;
    }
}
