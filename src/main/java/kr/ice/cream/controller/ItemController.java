package kr.ice.cream.controller;

import kr.ice.cream.dto.CustomerDTO;
import kr.ice.cream.dto.ItemDTO;
import kr.ice.cream.dto.ItemPageDTO;
import kr.ice.cream.dto.PageDTO;
import kr.ice.cream.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2015-07-16.
 */
@RestController
@RequestMapping("/item")
public class ItemController {

    @Autowired
    ItemService service;

    @RequestMapping(value = "/default", method = RequestMethod.GET)
    public List<ItemDTO> ItemDefaultList(){
        return service.pullMinItem();
    }

    @RequestMapping(value = "/pagedList", method = RequestMethod.GET)
    public ItemPageDTO itemPagedList(@RequestParam int curpage){
        return service.page(curpage + 1);
    }

    @RequestMapping(value = "sortedList", method = RequestMethod.GET)
    public List<ItemDTO> ItemSortedList(HttpSession session){
        CustomerDTO dto = (CustomerDTO) session.getAttribute("customer");
        return service.pullSortedItem(dto);
    }
    
    @RequestMapping(value = "/bestItem", method = RequestMethod.GET)
    public List<ItemDTO> bestItem(){
        return service.bestItem();
    }
    
    @RequestMapping(value = "/myConcept", method = RequestMethod.GET)
    public List<ItemDTO> myConcept(HttpSession session){
    	if(session.getAttribute("customer")!=null){
    		CustomerDTO dto = (CustomerDTO) session.getAttribute("customer");
    		HashMap<String, Integer> map = new HashMap<String, Integer>();
    		map.put("age", dto.getAge());
    		map.put("sex", dto.getSex());
    		
    		return service.myConcept(map);
    	}else{
    		return null;
    	}
    }
}
