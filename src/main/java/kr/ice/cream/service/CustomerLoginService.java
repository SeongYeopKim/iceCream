package kr.ice.cream.service;

import kr.ice.cream.dao.CustomerDAO;
import kr.ice.cream.dao.OrdersDAO;
import kr.ice.cream.dto.CustomerDTO;
import kr.ice.cream.dto.OrdersDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import java.util.List;

/**
 * Created by Administrator on 2015-07-12.
 */
@Service
public class CustomerLoginService {

    @Autowired
    CustomerDAO customerDao;
    @Autowired
    OrdersDAO ordersDAO;
    @Autowired
    PlatformTransactionManager transactionManager;

    /**
     * 로그인
     * @param id
     * @param password
     * @return
     */
    public CustomerDTO login(String id, String password){
        return customerDao.login(id,password);
    }

    /**
     * 회원탈퇴 맛 성향도 같이지움
     * @param srl
     * @return 1 성공, 0 실패
     */
    public int dropout(int srl){
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = transactionManager.getTransaction(def);

        int res = 0;
        try{
                res = customerDao.dropout(srl);
        } catch (Exception e){
            e.printStackTrace();
            transactionManager.rollback(status);
        }
        transactionManager.commit(status);

        return res;
    }

    /**
     * 회원 정보 변경
     * @param dto
     * @return 1 성공, 0 실패
     */
    public int alter(CustomerDTO dto){
        return customerDao.alter(dto);
    }

    /**
     * 회원의 주문 내역
     * @param customersrl
     * @return
     */
    public List<OrdersDTO> pullCustomerOrder(int customersrl){
        return ordersDAO.pullCustomerOrder(customersrl);
    }

}
