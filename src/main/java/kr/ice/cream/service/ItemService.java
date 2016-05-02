package kr.ice.cream.service;

import kr.ice.cream.dao.ItemDAO;
import kr.ice.cream.dao.ItemtasteDAO;
import kr.ice.cream.dto.*;
import kr.ice.cream.util.SortDTO;
import kr.ice.cream.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2015-07-16.
 */
@Service
public class ItemService {

    @Autowired
    ItemDAO dao;
    @Autowired
    ItemtasteDAO itDao;
    @Autowired
    PlatformTransactionManager transactionManager;

    /**
     * 카테고리가 1인 아이템들 리스트만 준다
     *
     * @return
     */
    public List<ItemDTO> pullMinItem() {
        return dao.pullMinItem();
    }

    public ItemPageDTO page(int curpage) {
        return dao.page(curpage);
    }

    /**
     * 고객의 맛 성향과 등록된 아이템의 맛 성향을 sorting 한 결과이다
     * @param dto
     * @return
     */
    public List<ItemDTO> pullSortedItem(CustomerDTO dto) {

        List<ItemtasteDTO> lt = new ArrayList<ItemtasteDTO>();
        lt = itDao.pullItemTaste();
        Utils u = new Utils(dto, lt);
        List<ItemtasteDTO> sortedList = u.inputMapV4();

        List<ItemDTO> list = new ArrayList<ItemDTO>();

        for(int i=0; i<sortedList.size(); i++){
            ItemDTO item = new ItemDTO();
            item = dao.pullItemByTitle(sortedList.get(i).getTitle());
            list.add(item);
        }
        return list;
    }

	public List<ItemDTO> bestItem() {
		return dao.bestItem();
	}


	public List<ItemDTO> myConcept(HashMap<String, Integer> map) {
		return dao.myConcept(map);
	}



}
