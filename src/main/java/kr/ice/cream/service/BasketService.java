package kr.ice.cream.service;

import kr.ice.cream.dao.BasketDAO;
import kr.ice.cream.dto.BasketDTO;
import kr.ice.cream.dto.BasketItemDTO;
import kr.ice.cream.dto.CustomerDTO;
import kr.ice.cream.dto.ItemDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015-07-13.
 */
@Service
public class BasketService {

    @Autowired
    BasketDAO basketDao;
    @Autowired
    PlatformTransactionManager transactionManager;

    DefaultTransactionDefinition def = null;
    TransactionStatus status = null;

    /**
     * 장바구니 리스트 불러오기
     * @param customersrl
     * @return
     */
    public List<BasketItemDTO> pullList(int customersrl){
    	return basketDao.pullList(customersrl);
    }

    /**
     * 장바구니 상태 변경
     * @param itemSrl 
     * @param srl
     * @return 0 뷰에서 안나온다 1 뷰에서 나옴
     */
    public int alterStatus(String itemSrl, int srl){
        return basketDao.alterStatus(itemSrl, srl);
    }

    /**
     * 장바구니에 리스트 추가 만약 이미 존재하면 플래그를 준다
     * @param dto
     * @return
     */
    public int insertCart(BasketDTO dto, CustomerDTO customer) {

        def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        status = transactionManager.getTransaction(def);

        int sangtae=1;

        try{
            List<Integer> itemsrlList = basketDao.pullItemSrl(customer.getSrl());
            for(int i=0; i<itemsrlList.size(); i++){
                if(itemsrlList.get(i)==dto.getItemsrl()){
                    sangtae=-1;
                }
            }
            if(sangtae!=-1){
                sangtae = basketDao.insertCart(dto);
            }
        } catch (Exception e){
            e.printStackTrace();
            transactionManager.rollback(status);
        }
        transactionManager.commit(status);
        return sangtae;
	}

    public List<BasketItemDTO> Basket_delete (int srl, int customersrl){
        def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        status = transactionManager.getTransaction(def);
        List<BasketItemDTO> list = new ArrayList<BasketItemDTO>();
        try {
            if(basketDao.alterStatus(srl)==1){
                list = basketDao.pullList(customersrl);
            } else{
                throw new Exception("상태변경이 안돼");
            }
        }catch (Exception e){
            e.printStackTrace();
            transactionManager.rollback(status);
        }
        transactionManager.commit(status);

        return list;
    }

}

