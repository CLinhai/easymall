package com.easybuy.controller;

import com.easybuy.entity.*;
import com.easybuy.service.AdminService;
import com.easybuy.service.CartService;
import com.easybuy.utils.UploadImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/admin")
public class AdminController {
@Autowired
private AdminService adminService;
@Autowired
private CartService cartService;
    @RequestMapping("/go")
    public String go(String url){
        return url;
    }

    @RequestMapping("/getUserList")
    public String getUserList(Model model){
        List userList = this.adminService.getUserList();
        model.addAttribute("userList", userList);
        return "admin/userList";
    }

    @RequestMapping("/getUser")
    public String getUser(int euUserId,Model model){
        EasybuyUser user = this.adminService.getUser(euUserId);
        model.addAttribute("user", user);
        return "admin/addOrUpdateUser";

    }

    @RequestMapping("/addOrUpdateUser")
    public String addOrUpdateUser(EasybuyUser user,HttpServletRequest request,
                                  @RequestParam("euFilepath1") MultipartFile upload) throws IOException {
        int i = 0;
        System.out.println(user);
        String serverpath = request.getServletContext().getRealPath("/");
        //上传图片工具类
        UploadImage.uploadImage(serverpath, user, upload);
        i = this.adminService.addOrUpdateUser(user);
        String type = request.getParameter("type");
        return "redirect:getUserList.do?adminType=" + (type.equals("addUser") ? "addUser" : "updateUser") + "&i=" + i;
    }

    @RequestMapping("/deleteUser")
    public  String deleteUser(int euUserId){
        int i = this.adminService.deleteUser(euUserId);
        return "redirect:getUserList.do?adminType=deleteUser&i="+i;
    }

    @RequestMapping("/getCategoryList")
    public String getCategoryList(Model model){
        Map map = this.adminService.getCategoryList();
        model.addAttribute("map", map);
        model.addAttribute("categories",map.get("categories"));
        return "admin/categoryList";

    }

    @RequestMapping("/getParentList")
    public String getParentList(Model model){
        List parentList = this.adminService.getgetParentList();
        model.addAttribute("parentList",parentList);
        return "admin/addOrUpdateCategory";
    }

    @RequestMapping("/getCategory")
    public  String getCategory(int epcId,Model model){
        List parentList = this.adminService.getgetParentList();
        model.addAttribute("parentList",parentList);
        EasybuyProductCategory category = this.adminService.getCategory(epcId);
        model.addAttribute("category",category);
        return "admin/addOrUpdateCategory";

    }

    @RequestMapping("/addOrUpdateCategory")
    public String addOrUpdateCategory(EasybuyProductCategory easybuyProductCategory){
        int i = this.adminService.addOrUpdateCategory(easybuyProductCategory);
        return "redirect:getCategoryList.do?type="+(easybuyProductCategory.getEpcId()==null?"addCategory":"updateCategory")+"&i="+i;
    }

    @RequestMapping("/deleteCategory")
    public String deleteCategory(int epcId){
        int i = this.adminService.deleteCategory(epcId);
        return "redirect:getCategoryList.do?type=deleteCategory&i="+i;
    }

    @RequestMapping("/getProductList")
    public String getProductList(Model model, @RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage) {
        PageBean pageBean = this.adminService.productList(currentPage);
        model.addAttribute("pageBean",pageBean);
        return "admin/productListAdmin";
    }

    @RequestMapping("/getChildList")
    public String getChildList(Model model){
        Map map = this.adminService.getChildList();
        model.addAttribute("map", map);
        return "admin/addOrUpdateProduct";
    }

    @RequestMapping("/getProductAdmin")
    public String getProduct(int epId,Model model){
        Map map= this.adminService.getProductAdmin(epId);
        model.addAttribute("map", map);
        model.addAttribute("product", map.get("product"));
        return "admin/addOrUpdateProduct";
    }

    @RequestMapping("/addOrUpdateProduct")
    public String addOrUpdateProduct(EasybuyProduct product,HttpServletRequest request,@RequestParam("epFileName1") MultipartFile upload) throws IOException {
        int i = 0;
        String serverpath = request.getServletContext().getRealPath("/");
        UploadImage.uploadImage(serverpath, product, upload);
        i = this.adminService.addOrUpdateProduct(product);
        String type = request.getParameter("type");
        return "redirect:getProductList.do?type=" + ("updateProduct".equals(type) ? "updateProduct" : "addProduct")+ "&i=" + i;


    }

    @RequestMapping("/deleteProduct")
    public String deleteProduct(int epId){
        int i = this.adminService.deleteProduct(epId);
        return "redirect:getProductList.do?type=deleteProduct&i="+i;
    }

    @RequestMapping("/getNewsList")
    public String getNewsList(Model model, @RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage){
        PageBean pageBean = this.adminService.getNewsList(currentPage);
        model.addAttribute("pageBean",pageBean);
        return "admin/newsList";
    }

    @RequestMapping("/getNews")
    public String getNews(int enId,Model model){
        EasybuyNews news = this.adminService.getNews(enId);
        model.addAttribute("news",news);
        return "admin/addOrUpdateNews";
    }

    @RequestMapping("/addOrUpdateNews")
    public String addOrUpdateNews(EasybuyNews easybuyNews){
        int i = this.adminService.addOrUpdateNews(easybuyNews);
        return "redirect:getNewsList.do?type="+(easybuyNews.getEnId()==null?"addNews":"updateNews")+"&i="+i;
    }

    @RequestMapping("/deleteNews")
    public String deleteNews(int enId){
        int i = this.adminService.deleteNews(enId);
        return "redirect:getNewsList.do?type=deleteNews&i="+i;
    }

    @RequestMapping("/getOrderList")
    public String getOrderList(Model model, @RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage){
        PageBean<EasybuyOrder> pageBean = this.adminService.getOrderList(currentPage);
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("orderList", pageBean.getLists());
        return "admin/orderList";
    }

    @RequestMapping("/getOrderByForm")
    public String getOrderByForm(int eoId,String eoUserName,Model model){
        EasybuyOrder orderByForm = this.adminService.getOrderByForm(eoId, eoUserName);
        List orderList=new ArrayList();
        orderList.add(orderByForm);
        model.addAttribute("orderList", orderList);
        return "admin/orderList";
    }

    @RequestMapping("/getOrder")
    public String getOrder(int eoId,Model model){
        EasybuyOrder order = this.adminService.getOrder(eoId);
        model.addAttribute("order",order);
        return "admin/updateOrder";

    }

    @RequestMapping("/updateOrder")
    public String updateOrder(EasybuyOrder easybuyOrder) throws ParseException {

        int i = this.adminService.updateOrder(easybuyOrder);
        return "redirect:getOrderList.do?type=updateOrder&i="+i;
    }


    @RequestMapping("/deleteOrder")
    public String deleteOrder(int eoId){
        int i = this.adminService.deleteOrder(eoId);
        return "redirect:getOrderList.do?type=deleteOrder&i="+i;
    }


    @RequestMapping("/cartAdd")
    public String cartAdd(HttpServletRequest request, HttpSession session){
        int epId =Integer.parseInt(request.getParameter("epId")) ;
        int count = Integer.parseInt(request.getParameter("count"));
        String url = request.getParameter("url");

        EasybuyUser user=(EasybuyUser)session.getAttribute("loginuser");
        if (user!=null){
            int i = this.cartService.cartAdd(epId, count, user.getEuUserId());
            if ("gobuy".equals(url)){
                return "redirect:getCart.do?uid="+user.getEuUserId();
            }else{
                return "redirect:../getProduct.do?epId="+epId+"&cartAddi="+i;
            }
        }
        return "../go.do?url=login";
    }

    @RequestMapping("/getCart")
    public String getCart(int uid, Model model){
        List cartList = this.cartService.getCart(uid);
        model.addAttribute("cartList", cartList);
        return "admin/shop";
    }

    @RequestMapping("/cartNumUpdate")
    @ResponseBody
    public  String cartNumUpdate(Integer carId,Integer count,HttpServletResponse response) throws IOException {
        int i = this.cartService.cartNumUpdate(carId, count);
        response.getWriter().print(i);
        return null;
    }


    @RequestMapping("/deleteCarts")
    public String deleteCarts(String ids,HttpServletResponse response) throws IOException {
        String[] id = ids.split(",");
        int i = this.cartService.deleteCarts(id);
        response.getWriter().print(i);
        return null;
    }

    @RequestMapping("/delCart")
    public String delCart(int carId, HttpServletResponse response) throws IOException {
        int i = this.cartService.deleteByPrimaryKey(carId);
        response.getWriter().print(i);
        return null;
    }

    @RequestMapping("/toOrder")
    public String toOrder(String ids,Model model,HttpSession session){
        String[] id = ids.split(",");
        EasybuyUser loginuser = (EasybuyUser)session.getAttribute("loginuser");
        Integer euUserId = loginuser.getEuUserId();
        Map map = this.cartService.toOrder(id, euUserId);
        model.addAttribute("list",map.get("list"));
        model.addAttribute("user", map.get("user"));

        return "admin/order";
    }

    @RequestMapping("/submitOrder")
    public String submitOrder( String eoUserName, String eoUserAddress, Double eoCost, HttpSession session, HttpServletRequest request){
        String[] carIds = request.getParameterValues("carId");

        EasybuyOrder order=new EasybuyOrder();
        EasybuyUser loginuser = (EasybuyUser)session.getAttribute("loginuser");
        order.setEoUserId(loginuser.getEuUserId());
        order.setEoUserName(eoUserName);
        order.setEoUserAddress(eoUserAddress);
        order.setEoCost(eoCost);

        this.cartService.submitOrder(carIds, order);
        return "redirect:go.do?url=admin/shopResult";
    }
}
