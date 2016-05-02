package kr.ice.cream.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import kr.ice.cream.dao.AdminDAO;
import kr.ice.cream.dao.BasketDAO;
import kr.ice.cream.dao.ItemDAO;
import kr.ice.cream.dao.ItemlistDAO;
import kr.ice.cream.dao.OrdersDAO;
import kr.ice.cream.dto.ItemDTO;
import kr.ice.cream.dto.ItemlistDTO;
import kr.ice.cream.dto.OrdersDTO;

/**
 * Created by Administrator on 2015-07-11.
 */
@Service
public class AdminService {

	@Autowired
	AdminDAO dao;

	public ArrayList<HashMap<String, Object>> getDayAmount() {
		return dao.getDayAmount();
	}

	public ArrayList<HashMap<String, Object>> getBestMenu() {
		return dao.getBestMenu();
	}

	public ArrayList<HashMap<String, Object>> getleastMenu() {
		return dao.getleastMenu();
	}

	public ArrayList<HashMap<String, Object>> getageChart() {
		return dao.getageChart();
	}
	
	public ArrayList<HashMap<String, Object>> getTaste1() {
		return dao.getTaste1();
	}
	public ArrayList<HashMap<String, Object>> getTaste2() {
		return dao.getTaste2();
	}
	public ArrayList<HashMap<String, Object>> getTaste3() {
		return dao.getTaste3();
	}
	public ArrayList<HashMap<String, Object>> getTaste4() {
		return dao.getTaste4();
	}
	public ArrayList<HashMap<String, Object>> getTaste5() {
		return dao.getTaste5();
	}
	public ArrayList<HashMap<String, Object>> getTimeCnt() {
		return dao.getTimeCnt();
	}
	public int login(String id, String pw) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		return dao.login(map);
	}
	

}
