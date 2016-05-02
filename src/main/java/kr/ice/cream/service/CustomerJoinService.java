package kr.ice.cream.service;

import kr.ice.cream.dao.CustomerDAO;
import kr.ice.cream.dto.CustomerDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2015-07-12.
 */
@Service
public class CustomerJoinService {

    @Autowired
    CustomerDAO customerDao;

    /**
     * 회원가입
     * @param dto
     * @return 1 성공, 0 실패
     */
    public int join(CustomerDTO dto){
        if(customerDao.join(dto)==1){
            return 1;
        } else
            return -1;

    }

    /**
     * id 중복 체크
     * @param id
     * @return 1 아이디 중복 없음, 0 아이디 중복
     */
    public int inDupCheck(String id){
        if(customerDao.idDupCheck(id)!=null){
            return 0;
        } else return 1;
    }


}
