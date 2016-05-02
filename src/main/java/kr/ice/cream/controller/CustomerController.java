package kr.ice.cream.controller;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.util.JSONPObject;
import kr.ice.cream.dto.*;
import kr.ice.cream.service.BasketService;
import kr.ice.cream.service.CustomerJoinService;
import kr.ice.cream.service.CustomerLoginService;
import kr.ice.cream.service.ItemService;
import kr.ice.cream.service.OrderInputService;
import kr.ice.cream.service.OrderPullService;
import kr.ice.cream.util.DateFormatting;
import org.json.JSONArray;
import org.json.JSONObject;
import org.omg.CORBA.OBJ_ADAPTER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * Created by Administrator on 2015-07-13.
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    CustomerJoinService joinService;
    @Autowired
    CustomerLoginService loginService;
    @Autowired
    ItemService service;

    @Autowired
    OrderInputService orderService;
    @Autowired
    BasketService basketService;
    @Autowired
    OrderPullService orderPullService;

    /**
     * 회원 가입 페이지 호출 (webapp/WEB-INF/views/customer/join.jsp)
     *
     * @return
     */
    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public String CustomerJoinPage() {
        return "customer/join";
    }

    /**
     * 회원 가입 프로세스 (webapp/WEB-INF/views/customer/main.jsp 호출)
     *
     * @param dto
     * @return 1 성공, -1 실패
     */
    @RequestMapping(value = "/joinProcess", method = RequestMethod.POST)
    public ModelAndView CustomerJoinProcess(@ModelAttribute CustomerDTO dto) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("joinResult", joinService.join(dto));
        mav.setViewName("/customer/login");
        return mav;
    }

    /**
     * 아이디 중복 체크
     *
     * @param id
     * @return 1 중복 없음(사용가능), 0 중복 (사용불가)
     */
    @RequestMapping(value = "/idDupCheck", method = RequestMethod.POST)
    public
    @ResponseBody
    int CustomerIdDupCheck(@RequestParam String id) {
        if (id != "") {
            int a = joinService.inDupCheck(id);
            return a;
        }
        return -1;
    }

    /**
     * 로그인 페이지 호출
     *
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String CustomerLogin() {
        return "customer/login";
    }

    /**
     * 로그인 프로세스
     *
     * @param id
     * @param password
     * @param session
     * @return
     */
    @RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
    public ModelAndView CustomerLoginProcess(@RequestParam String id, @RequestParam String password,
                                             HttpSession session) {
        CustomerDTO dto = loginService.login(id, password);
        ModelAndView mav = new ModelAndView();
        if (dto != null) {
            session.setAttribute("customer", dto);
            mav.setViewName("/customer/home");
        } else {
            mav.addObject("loginStatus", "fail");
            mav.setViewName("/customer/login");
        }
        return mav;
    }

    /**
     * 회원정보 변경 페이지 호출
     *
     * @return
     */
    @RequestMapping(value = "/alter", method = RequestMethod.GET)
    public String CusstomerDropout() {
        return "customer/alter";
    }

    /**
     * 회원 탈퇴 프로세스
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/dropoutProcess", method = RequestMethod.POST)
    public String CustomerDropoutProcess(HttpSession session) {
        CustomerDTO dto = (CustomerDTO) session.getAttribute("customer");
        loginService.dropout(dto.getSrl());
        session.invalidate();
        return "customer/loginSuccess"; // 세션이 말소되었는지 확인하려고 일로 보냄
    }

    /**
     * 회원정보 변경 프로세스
     *
     * @param dto
     * @param session
     * @param mav
     * @return
     */
    @RequestMapping(value = "/alterProcess", method = RequestMethod.POST)
    public String CustomerAlterProcess(@ModelAttribute CustomerDTO dto, HttpSession session, ModelAndView mav) {
        if (loginService.alter(dto) == 1) {
            session.removeAttribute("customer");
            session.setAttribute("customer", dto);
            mav.addObject("msg", "success");
        } else {
            mav.addObject("msg", "fail");
        }
        return "customer/loginSuccess";
    }

    @RequestMapping(value = "/itemlist", method = RequestMethod.GET)
    public String CustomerItemlist() {
        return "customer/itemlistsort";
    }

    /**
     * 로그아웃
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String CustomerLogout(HttpSession session) {
        session.invalidate();
        return "redirect:/customer/home";
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String CustomerHome() {
        return "customer/home";
    }

    @RequestMapping(value = "/shop", method = RequestMethod.GET)
    public String CustomerShop() {
        return "customer/shop";
    }

    // 장바구니에 상품 추가 추가후 장바구니로 이동한다.
    @RequestMapping(value = "/insertcart_shop", method = RequestMethod.GET)
    public String CustomerInsertCartShop(@RequestParam("select") String select, HttpSession session) {
        BasketDTO dto = new BasketDTO();
        CustomerDTO customer = (CustomerDTO) session.getAttribute("customer");

        dto.setCustomersrl(customer.getSrl());
        dto.setItemsrl(Integer.parseInt(select));

        // basketDup이 1이면 중복된 장바구니 목록이 없는것이고, -1이면 중복된게 존재한다는뜻
        if (basketService.insertCart(dto, customer) == 1) {
            session.setAttribute("basketDup", 1);
            return "redirect:/customer/cart";
        } else {
            session.setAttribute("basketDup", -1);
            return "redirect:/customer/shop";
        }
    }

    @RequestMapping(value = "/insertcart_home", method = RequestMethod.GET)
    public String CustomerInsertCartHome(@RequestParam("select") String select, HttpSession session) {
        BasketDTO dto = new BasketDTO();
        CustomerDTO customer = (CustomerDTO) session.getAttribute("customer");

        dto.setCustomersrl(customer.getSrl());
        dto.setItemsrl(Integer.parseInt(select));

        // basketDup이 1이면 중복된 장바구니 목록이 없는것이고, -1이면 중복된게 존재한다는뜻
        if (basketService.insertCart(dto, customer) == 1) {
            session.setAttribute("basketDup", 1);
            return "redirect:/customer/cart";
        } else {
            session.setAttribute("basketDup", -1);
            return "redirect:/customer/home";
        }
    }

    @RequestMapping(value = "insertcart_noreturn", method = RequestMethod.POST)
    public void CustomerInsertCart_Noreturn(@RequestParam String select, HttpSession session) {
        CustomerDTO customer = (CustomerDTO) session.getAttribute("customer");
        BasketDTO dto = new BasketDTO();
        dto.setCustomersrl(customer.getSrl());
        dto.setItemsrl(Integer.parseInt(select));


        if (basketService.insertCart(dto, customer) == 1) {
            session.setAttribute("basketDup", 1);
        } else {
            session.setAttribute("basketDup", -1);
        }
    }

    //바로 장바구니로 접근
    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public ModelAndView CustomerCart(HttpSession session) {
        int srl = ((CustomerDTO) session.getAttribute("customer")).getSrl();
        List<BasketItemDTO> list = basketService.pullList(srl);
        ObjectMapper mapper = new ObjectMapper();
        String list_json = null;
        try {
            list_json = mapper.writeValueAsString(list);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        ModelAndView mav = new ModelAndView();
        mav.addObject("cartList", list_json);
        mav.setViewName("/customer/cart");
        return mav;
    }

    //장바구니에 있는 상품 제거
    @RequestMapping(value = "/alterCart", method = RequestMethod.GET)
    public String alterCart(HttpSession session, @RequestParam String itemSrl) {

        int cusSrl = ((CustomerDTO) session.getAttribute("customer")).getSrl();
        basketService.alterStatus(itemSrl, cusSrl);
        return "redirect:/customer/cart";
    }

//	@RequestMapping(value = "/basket_delete", method = RequestMethod.POST)
//	public @ResponseBody List<BasketItemDTO> CustomerBasket_Delete(@RequestParam int srl, HttpSession session){
//		CustomerDTO dto = (CustomerDTO) session.getAttribute("customer");
//		return basketService.Basket_delete(srl,dto.getSrl());
//	}

    @RequestMapping(value = "/basket_delete", method = RequestMethod.GET)
    public String CustomerBasket_Delete(@RequestParam int srl, HttpSession session) {
        CustomerDTO dto = (CustomerDTO) session.getAttribute("customer");
        basketService.Basket_delete(srl, dto.getSrl());
        return "redirect:/customer/cart";
    }

    @RequestMapping(value = "/buy", method = RequestMethod.POST)
    public
    @ResponseBody
    List<ItemDTO> buy(@RequestParam String item, HttpSession session1) {
        ObjectMapper mapper = new ObjectMapper();
        List<ItemDTO> list = new ArrayList<ItemDTO>();
        try {
            list = mapper.readValue(item, new TypeReference<List<ItemDTO>>() {
            });
        } catch (IOException e) {
            e.printStackTrace();
        }
        session1.removeAttribute("basketDup");

        session1.setAttribute("ttt", list);
        if (session1.getAttribute("ttt") != null) {
            System.out.println("buy: " + session1.getAttribute("ttt"));
            return (List<ItemDTO>) session1.getAttribute("ttt");
        } else return null;
    }

    @RequestMapping(value = "/tongro", method = RequestMethod.POST)
    public String goaway(@RequestParam String item) {

        return "str";
    }


    @RequestMapping(value = "/orderinput", method = RequestMethod.POST)
    public String testtest(HttpServletRequest request, HttpSession session, Model model) {
        String[] srl = request.getParameterValues("srl");
        String[] amount = request.getParameterValues("amount");
        String[] itemsrl = request.getParameterValues("itemsrl");
        CustomerDTO dto = (CustomerDTO) session.getAttribute("customer");


        List<BasketDTO> basketList = new ArrayList<BasketDTO>();
        for (int i = 0; i < srl.length; i++) {
            int amount_int = Integer.parseInt(amount[i]);
            if (amount_int == 0) {
                amount_int = 1;
            }
            BasketDTO basket = new BasketDTO();
            basket.setItemsrl(Integer.parseInt(itemsrl[i]));
            basket.setSrl(Integer.parseInt(srl[i]));
            basket.setAmount(amount_int);
            basketList.add(basket);
        }

        OrdersDTO order = new OrdersDTO();
        order.setCustomersrl(dto.getSrl());
        order.setPhase(0);
        order.setSort(new DateFormatting().setSort(dto.getSrl()));
        order.setTitle(new DateFormatting().today() + " " + dto.getName() + " 님의 주문");

        int n = orderService.input(order, basketList);

        if (n == 1) {
            model.addAttribute("orderResult", "주문성공");
            return "customer/home";
        } else {
            model.addAttribute("orderResult", "주문실패");
           return "customer/cart";
        }

    }

    @RequestMapping(value = "/orderlist", method = RequestMethod.GET)
	public @ResponseBody List<OrderItemlistDTO> pullCustomerOrder(HttpSession session){
		CustomerDTO dto = (CustomerDTO) session.getAttribute("customer");
		return orderPullService.pullCustomerOrder(dto.getSrl());
	}
    @RequestMapping(value = "/myorder", method = RequestMethod.GET)
	public String myorder() {

		return "/customer/myorder";
	}
}
