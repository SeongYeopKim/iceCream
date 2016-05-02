/*
* 작성일 : 2015. 7. 9.
* 작성자 : Administrator
*
* 설명
*/
package kr.ice.cream.dao;

import java.util.HashMap;
import java.util.Map;

import kr.ice.cream.dto.CustomerDTO;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDAO extends SqlSessionDaoSupport{

	/**
	 * 로그인
	 * @param id
	 * @param password
	 * @return dto != null 로그인 성공 dto == null 로그인 실패
	 */
	public CustomerDTO login(String id, String password){
		CustomerDTO dto = new CustomerDTO();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);
		
		if(getSqlSession().update("customer.loginDate",map)==1){
			dto = (CustomerDTO) getSqlSession().selectOne("customer.login", map);
		} else dto = null;
		
		return dto;
	}
	
	/**
	 * 회원가입
	 * @param customer
	 * @return 1 성공, 0 실패
	 */
	public int join(CustomerDTO customer){
		return getSqlSession().insert("customer.join", customer);
	}
	
	/**
	 * 회원정보 변경
	 * @param customer
	 * @return 1 성공, 0 실패
	 */
	public int alter(CustomerDTO customer){
		return getSqlSession().update("customer.alter", customer);
	}
	
	/**
	 * 아이디 중복 체크
	 * @param id
	 * @return dto != null 아이디 중복, dto == null 아이디 중복X
	 */
	public CustomerDTO idDupCheck(String id){
		return (CustomerDTO) getSqlSession().selectOne("customer.idDupCheck", id);
	}

	/**
	 * 회원 탈퇴
	 * @param srl
	 * @return 1 성공, 0 실패
	 */
	public int dropout(int srl) {
		return getSqlSession().delete("customer.dropout", srl);
	}
}
