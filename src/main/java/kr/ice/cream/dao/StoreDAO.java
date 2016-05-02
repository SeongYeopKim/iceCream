/*
* 작성일 : 2015. 7. 9.
* 작성자 : Administrator
*
* 설명
*/
package kr.ice.cream.dao;

import java.util.HashMap;
import java.util.Map;

import kr.ice.cream.dto.StoreDTO;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDAO extends SqlSessionDaoSupport{
	
	/**
	 * 로그인
	 * @param id
	 * @param password
	 * @return dto != null 로그인 성공 dto = null 로그인 실패
	 */
	public StoreDTO login(String id, String password){
		StoreDTO dto = new StoreDTO();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);
		
		
		if(getSqlSession().update("store.loginDate", map)==1){
			dto = (StoreDTO) getSqlSession().selectOne("store.login", map);
		} else dto = null;
		
		return dto;
	}
}
