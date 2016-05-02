/*
* 작성일 : 2015. 7. 11.
* 작성자 : Administrator
*
* 설명
*/
package kr.ice.cream.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
@SuppressWarnings("unchecked")
public class AdminDAO extends SqlSessionDaoSupport {

	public ArrayList<HashMap<String, Object>> getDayAmount() {
		return (ArrayList<HashMap<String, Object>>) getSqlSession().selectList("admin.dayamount");
	}

	public ArrayList<HashMap<String, Object>> getBestMenu() {
		return (ArrayList<HashMap<String, Object>>) getSqlSession().selectList("admin.bestmenu");
	}

	public ArrayList<HashMap<String, Object>> getleastMenu() {
		return (ArrayList<HashMap<String, Object>>) getSqlSession().selectList("admin.leastmenu");
	}

	public ArrayList<HashMap<String, Object>> getageChart() {
		return (ArrayList<HashMap<String, Object>>) getSqlSession().selectList("admin.ageChart");
	}
	
	public ArrayList<HashMap<String, Object>> getTimeCnt() {
		return (ArrayList<HashMap<String, Object>>) getSqlSession().selectList("admin.getTimeCnt");
	}
	

	public ArrayList<HashMap<String, Object>> getTaste1() {
		return (ArrayList<HashMap<String, Object>>) getSqlSession().selectList("admin.taste1");
	}

	public ArrayList<HashMap<String, Object>> getTaste2() {
		return (ArrayList<HashMap<String, Object>>) getSqlSession().selectList("admin.taste2");
	}

	public ArrayList<HashMap<String, Object>> getTaste3() {
		return (ArrayList<HashMap<String, Object>>) getSqlSession().selectList("admin.taste3");
	}

	public ArrayList<HashMap<String, Object>> getTaste4() {
		return (ArrayList<HashMap<String, Object>>) getSqlSession().selectList("admin.taste4");
	}

	public ArrayList<HashMap<String, Object>> getTaste5() {
		return (ArrayList<HashMap<String, Object>>) getSqlSession().selectList("admin.taste5");
	}
	public int login(HashMap<String, String> map) {
		return (Integer) getSqlSession().selectOne("admin.login",map);
	}
}
