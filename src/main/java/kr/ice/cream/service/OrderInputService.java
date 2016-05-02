package kr.ice.cream.service;

import kr.ice.cream.dao.BasketDAO;
import kr.ice.cream.dao.ItemDAO;
import kr.ice.cream.dao.ItemlistDAO;
import kr.ice.cream.dao.OrdersDAO;
import kr.ice.cream.dto.BasketDTO;
import kr.ice.cream.dto.ItemDTO;
import kr.ice.cream.dto.ItemlistDTO;
import kr.ice.cream.dto.OrdersDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import java.util.List;

/**
 * Created by Administrator on 2015-07-11.
 */
@Service
public class OrderInputService {

    @Autowired
    OrdersDAO orderDao;
    @Autowired
    ItemlistDAO itemlistDao;
    @Autowired
    ItemDAO itemDao;
    @Autowired
    BasketDAO basketDao;
    @Autowired
    PlatformTransactionManager transactionManager;

    DefaultTransactionDefinition def = null;
    TransactionStatus status = null;

    /**
     * 주문 입력
     * @param dto
     * @param itemlist
     * @return 1 성공, 0 실패
     */
    public int input(OrdersDTO dto, List<BasketDTO> itemlist){
        def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        status = transactionManager.getTransaction(def);

        OrdersDTO orders = new OrdersDTO();
        int res = 0;
        try {
            orderDao.input(dto);
            for (int i=0; i<itemlist.size(); i++){
                ItemlistDTO item = new ItemlistDTO();
                item.setAmount(itemlist.get(i).getAmount());
                item.setItemsrl(itemlist.get(i).getItemsrl());
                item.setSort(dto.getSort());
                itemlistDao.input(item);
                basketDao.alterStatus(itemlist.get(i).getSrl());
            }
            orders.setPrice(setPrice(dto.getSort()));
            orders.setSort(dto.getSort());
            res = orderDao.plusPrice(orders);

        } catch (Exception e) {
            e.printStackTrace();
            transactionManager.rollback(status);
        }
        transactionManager.commit(status);

        return res;
    }

    public int setPrice(String sort) {
        List<ItemlistDTO> list = itemlistDao.pullItemlist(sort);
        int price = 0;
        for(int i=0; i<list.size(); i++) {
            ItemDTO item = itemDao.pullItem(list.get(i).getItemsrl());
            price += item.getPrice()*list.get(i).getAmount();
        }
        return price;
    }

}
