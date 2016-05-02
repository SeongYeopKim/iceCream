package kr.ice.cream.service;

import kr.ice.cream.dao.StoreDAO;
import kr.ice.cream.dto.StoreDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2015-07-12.
 */
@Service
public class StoreManageService {

    @Autowired
    StoreDAO storeDao;

    /**
     * 로그인
     * @param id
     * @param password
     * @return
     */
    public StoreDTO login(String id, String password){
        return storeDao.login(id,password);
    }
}
