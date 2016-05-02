package kr.ice.cream.service;

import kr.ice.cream.dao.ItemlistDAO;
import kr.ice.cream.dao.OrdersDAO;
import kr.ice.cream.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015-07-28.
 */
@Service
public class OrderPullService {

    @Autowired
    OrdersDAO dao;
    @Autowired
    ItemlistDAO ilDao;

    public List<OrderItemlistDTO> pullOrder10(){
        List<OrderItemlistDTO> oilist = new ArrayList<OrderItemlistDTO>();

        List<OrdersDTO> orderlist = dao.pullOrder10();
        for(int i=0; i<orderlist.size(); i++){
            OrderItemlistDTO oi = new OrderItemlistDTO();
            oi.setOrders(orderlist.get(i));

            List<OrderItem> orderItemList = ilDao.pullOrderItemlist(orderlist.get(i).getSort());
            oi.setOrderItemlist(orderItemList);
            oilist.add(oi);
        }
        return oilist;
    }

    public CustomizedPageDTO pullAllOrder(int curpage){
        List<OrderItemlistDTO> oilist = new ArrayList<OrderItemlistDTO>();

        PageDTO pageDTO = dao.pullAllOrder(curpage);
        List<OrdersDTO> orderlist = pageDTO.getList();
        for(int i=0; i<orderlist.size(); i++){
            OrderItemlistDTO oi = new OrderItemlistDTO();
            oi.setOrders(orderlist.get(i));

            List<OrderItem> orderItemList = ilDao.pullOrderItemlist(orderlist.get(i).getSort());
            oi.setOrderItemlist(orderItemList);
            oilist.add(oi);
        }
        CustomizedPageDTO dto = new CustomizedPageDTO();
        dto.setTotalCount(pageDTO.getTotalCount());
        dto.setCurpage(pageDTO.getCurpage());
        dto.setList(oilist);

        return dto;
    }

    public int alterPhase(int srl){
        return dao.alterPhase(srl);
    }
    public List<OrderItemlistDTO> pullCustomerOrder(int customersrl){
        List<OrderItemlistDTO> oilist = new ArrayList<OrderItemlistDTO>();

        List<OrdersDTO> orderlist = dao.pullCustomerOrder(customersrl);
        for(int i=0; i<orderlist.size(); i++){
            OrderItemlistDTO oi = new OrderItemlistDTO();
            oi.setOrders(orderlist.get(i));

            List<OrderItem> orderItemList = ilDao.pullOrderItemlist(orderlist.get(i).getSort());
            oi.setOrderItemlist(orderItemList);
            oilist.add(oi);
        }
        return oilist;
    }
}
