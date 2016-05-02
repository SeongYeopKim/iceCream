package kr.ice.cream.controller;

import kr.ice.cream.dto.CustomizedPageDTO;
import kr.ice.cream.dto.OrderItemlistDTO;
import kr.ice.cream.dto.StoreDTO;
import kr.ice.cream.service.OrderPullService;
import kr.ice.cream.service.StoreManageService;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2015-07-14.
 */
@Controller
@RequestMapping("/store")
public class StoreController {

    @Autowired
    StoreManageService service;
    @Autowired
    OrderPullService orderPullService;

    /**
     * 관리자 로그인 페이지 호출
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String StoreLogin(){
        return "store/login";
    }

    /**
     * 관리자 로그인 프로세스
     * @param id
     * @param password
     * @param session
     * @return
     */
    @RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
    public String StoreLoginProcess(@RequestParam String id, @RequestParam String password, HttpSession session){
        StoreDTO dto = service.login(id,password);
        session.setAttribute("store",dto);
        return "store/loginSuccess";
    }

    @RequestMapping(value = "/test")
    public @ResponseBody List<OrderItemlistDTO> test(){
        return orderPullService.pullOrder10();
    }


    @RequestMapping(value = "/alterPhase", method = RequestMethod.POST)
    public String StoreAlterPhases(@RequestParam int srl){
        orderPullService.alterPhase(srl);
        return "redirect:/admin/";
    }

    @RequestMapping(value = "/order_data")
    public @ResponseBody CustomizedPageDTO StoreAllOrder(@RequestParam int curpage){
        if(curpage==0)
            curpage=1;
        return orderPullService.pullAllOrder(curpage);
    }

    /**
     * 나중에 호출은 여기서
     * @param curpage
     * @param model
     * @return
     */
    @RequestMapping(value = "/order_list")
    public String StoreOrderList(@RequestParam int curpage, Model model){
        model.addAttribute("curpage", curpage);
        return "admin/order_list";
    }

    /**
     * 처음 호출은 여기서
     * @return
     */
    @RequestMapping(value = "order_first_list")
    public String StoreOrderFirstList(){
        return "admin/order_list";
    }
}