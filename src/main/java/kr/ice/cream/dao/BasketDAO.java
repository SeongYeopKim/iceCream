package kr.ice.cream.dao;

import kr.ice.cream.dto.BasketDTO;
import kr.ice.cream.dto.BasketItemDTO;
import kr.ice.cream.dto.ItemDTO;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2015-07-13.
 */
@Repository
public class BasketDAO extends SqlSessionDaoSupport{

	/**
     * status가 1인 상태의 장바구니 내용을 불러온다
     * @param customersrl
     * @return
     */
    public List<BasketItemDTO> pullList(int customersrl){
        return getSqlSession().selectList("basket.pullList", customersrl);
    }

    /**
     * 장바구니 상태 변경
     * @param srl
     * @return
     */
    public int alterStatus(int srl){
        return getSqlSession().update("basket.alterStatus", srl);
    }
    
    /**
     * 장바구니에 아이템 압력
     * @param dto
     * @return 1 성공, 0 실패
     */
	public int insertCart(BasketDTO dto) {
		return getSqlSession().insert("basket.insertCart", dto);
	}
	

    /**
     * 장바구니 상태 변경
     * @param itemSrl ,customerSrl
     * @param srl
     * @return
     */
    public int alterStatus(String itemSrl, int srl){
    	HashMap<String,Object> map = new HashMap<String, Object>();
    	map.put("itemSrl", itemSrl);
    	map.put("cusSrl", srl);
        return getSqlSession().update("basket.alterItem", map);
    }

    /**
     * status가 1인 장바구니 itemsrl 목록을 가져온다
     * @param customersrl
     * @return
     */
    public List<Integer> pullItemSrl(int customersrl){
        return getSqlSession().selectList("basket.pullItemSrl", customersrl);
    }
}
