/*
* 작성일 : 2015. 7. 9.
* 작성자 : Administrator
*
* 설명
*/
package kr.ice.cream.dao;

import kr.ice.cream.dto.ItemDTO;
import kr.ice.cream.dto.ItemPageDTO;
import kr.ice.cream.dto.ItemtasteDTO;
import kr.ice.cream.dto.PageDTO;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class ItemDAO extends SqlSessionDaoSupport{
	
	/**
	 * 아이템 추가
	 * @param item
	 * @return 1 성공, 0 실패
	 * ** 사진 업로드 필요함
	 */
	public int insert(ItemDTO item){
		return getSqlSession().insert("item.insert", item);
	}
	
	/**
	 * 아이템 전체 리스트 불러오기
	 * @return List<ItemDTO> != null 성공, List<ItemDTO> == null 실패
	 */
	@SuppressWarnings("unchecked")
	public List<ItemDTO> pullAllItem(){
		return getSqlSession().selectList("item.pullAllItem");
	}
	
	/**
	 * 아이템 정보 불러오기
	 * @param srl
	 * @return ItemDTO != null 성공, ItemDTO == null 실패
	 */
	public ItemDTO pullItem(int srl){
		return (ItemDTO) getSqlSession().selectOne("item.pullItem", srl);
	}
	
	/**
	 * 아이템 가격 불러오기
	 * @param srl
	 * @return price != 0 성공, price ==0 실패
	 */
	public int pullPrice(int srl){
		return (Integer) getSqlSession().selectOne("item.pullPrice", srl);
	}

	/**
	 * 아이템 카테고리 1 불러오기
	 * @return
	 */
	public List<ItemDTO> pullMinItem(){
		return getSqlSession().selectList("item.pullMinItem");
	}

	public ItemPageDTO page(int curpage) {
		ItemPageDTO list = new ItemPageDTO();
		int perpage = list.getPerpage();
		int skip = (curpage-1)*perpage;
		int totalcount = getCount();

		List<ItemDTO> i = getSqlSession().selectList("item.pullMinItem", null, new RowBounds(skip, perpage));
		list.setList(i);
		list.setCurpage(curpage);
		list.setTotalCount(totalcount);
		return list;
	}

	public int getCount(){
		return (Integer)getSqlSession().selectOne("item.minItemCount");
	}

	public int pullCount(){
		return (Integer)getSqlSession().selectOne("item.itemCount");
	}

	public ItemDTO pullItemByTitle(String title){
		return (ItemDTO) getSqlSession().selectOne("item.pullItemByTitle",title);
	}
	public List<ItemDTO> bestItem() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("item.bestItem");
	}

	public List<ItemDTO> myConcept(HashMap<String, Integer> map) {
		return getSqlSession().selectList("item.myConcept",map);
	}
}
