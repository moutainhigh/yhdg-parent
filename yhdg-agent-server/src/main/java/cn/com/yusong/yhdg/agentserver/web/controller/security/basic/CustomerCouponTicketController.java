package cn.com.yusong.yhdg.agentserver.web.controller.security.basic;

import cn.com.yusong.yhdg.agentserver.entity.SessionUser;
import cn.com.yusong.yhdg.agentserver.service.basic.CustomerCouponTicketService;
import cn.com.yusong.yhdg.agentserver.service.basic.CustomerService;
import cn.com.yusong.yhdg.common.annotation.SecurityControl;
import cn.com.yusong.yhdg.common.annotation.ViewModel;
import cn.com.yusong.yhdg.common.domain.basic.Customer;
import cn.com.yusong.yhdg.common.domain.basic.CustomerCouponTicket;
import cn.com.yusong.yhdg.common.entity.json.ExtResult;
import cn.com.yusong.yhdg.common.entity.json.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping(value = "/security/basic/customer_coupon_ticket")
public class CustomerCouponTicketController extends SecurityController {
    @Autowired
    CustomerCouponTicketService customerCouponTicketService;
    @Autowired
    CustomerService customerService;

    @SecurityControl(limits = "basic.CustomerCouponTicket:list")
    @RequestMapping(value = "index.htm")
    public void index(Model model) {
        model.addAttribute("StatusEnum", CustomerCouponTicket.Status.values());
        model.addAttribute("TicketTypeEnum", CustomerCouponTicket.TicketType.values());
        model.addAttribute("usedStatus", CustomerCouponTicket.Status.USED.getValue());
        model.addAttribute(MENU_CODE_NAME, "basic.CustomerCouponTicket:list");
    }

    @RequestMapping(value = "view_coupon_ticket.htm")
    public String viewForegiftOrder(Model model, long customerId) {
        model.addAttribute("StatusEnum", CustomerCouponTicket.Status.values());
        model.addAttribute("TicketTypeEnum", CustomerCouponTicket.TicketType.values());
        model.addAttribute("customerId", customerId);
        Customer customer = customerService.find(customerId);
        model.addAttribute("customerMobile", customer.getMobile());
        return "/security/basic/customer/view_coupon_ticket";
    }

    @RequestMapping("page.htm")
    @ViewModel(ViewModel.JSON)
    @ResponseBody
    public PageResult page(CustomerCouponTicket search) {
        search.setCategory(CustomerCouponTicket.Category.EXCHANGE.getValue());
        return PageResult.successResult(customerCouponTicketService.findPage(search));
    }

    @RequestMapping(value = "add.htm")
    public void add(Model model) {
        model.addAttribute("StatusEnum", CustomerCouponTicket.Status.values());
        model.addAttribute("TicketTypeEnum", CustomerCouponTicket.TicketType.values());
    }

    @RequestMapping("create.htm")
    @ViewModel(ViewModel.JSON)
    @ResponseBody
    public ExtResult create(CustomerCouponTicket entity, HttpSession httpSession) {
        SessionUser sessionUser = getSessionUser(httpSession);
        String userName = sessionUser.getUsername();
        entity.setOperator(userName);
        entity.setCategory(CustomerCouponTicket.Category.EXCHANGE.getValue());
        return customerCouponTicketService.create(entity);
    }

    @RequestMapping(value = "view.htm")
    public String view(Model model, long id) {
        CustomerCouponTicket entity = customerCouponTicketService.find(id);
        if(entity == null) {
            return SEGMENT_RECORD_NOT_FOUND;
        } else {
            model.addAttribute("StatusEnum", CustomerCouponTicket.Status.values());
            model.addAttribute("TicketTypeEnum", CustomerCouponTicket.TicketType.values());
            model.addAttribute("entity", entity);
        }
        return "/security/basic/customer_coupon_ticket/view";
    }

    @RequestMapping("delete.htm")
    @ViewModel(ViewModel.JSON)
    @ResponseBody
    public ExtResult delete(long id) {
        return customerCouponTicketService.delete(id);
    }
}
