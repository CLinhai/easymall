package com.easybuy.controller;

import com.easybuy.entity.*;
import com.easybuy.service.AdminService;
import com.easybuy.service.CartService;
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
    public String addOrUpdateUser(HttpServletRequest request, @RequestParam("euFilepath") MultipartFile upload) throws IOException {
        int i = 0;
        EasybuyUser user=new EasybuyUser();

        String euUserId = request.getParameter("euUserId");
        if (euUserId != null && !euUserId.equals("")) {
            user.setEuUserId(Integer.valueOf(euUserId));
        }
       user.setEuUserLoginid(request.getParameter("euUserLoginid"));
       user.setEuUserName(request.getParameter("euUserName"));
       user.setEuPassword(request.getParameter("euPassword"));
       user.setEuSex(request.getParameter("euSex"));
       user.setEuBirthday(request.getParameter("euBirthday"));
       user.setEuMobile(request.getParameter("euMobile"));
       user.setEuAddress(request.getParameter("euAddress"));

        String serverpath = request.getServletContext().getRealPath("/");
        System.out.println(serverpath);
        String path = "upload/images/";
        String pathtmp = "upload/imagestmp/";
        File file = new File(serverpath + path);
        File filetmp = new File(serverpath + pathtmp);
        if (!file.isDirectory()) {
            file.mkdirs();
        }
        if (!filetmp.isDirectory()) {
            filetmp.mkdirs();
        }

        // 获取上传文件项名称,做文件名称随机处理避免上传相同文件名覆盖
        String uuid = UUID.randomUUID().toString().replace("-", "");
        String originalFilename = upload.getOriginalFilename();

        if (originalFilename != null && !originalFilename.equals("")) {
            String fileName = uuid + "_" + upload.getOriginalFilename();
            // 这里是upload.getOriginalFilename()而不是upload.getName()后者只是得到文件项的名字
            upload.transferTo(new File(serverpath + path, fileName));
            user.setEuFilepath(path+fileName);
         /*   String realPath = request.getServletContext().getRealPath("/upload");
            //对路径中upload文件夹是否存在
            File filePath = new File(realPath);
            if (!filePath.exists()) {
                filePath.mkdir();
            }
            upload.transferTo(new File(realPath,originalFilename));*/
        } else {
            user.setEuFilepath(null);
        }
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
    public String addOrUpdateProduct(HttpServletRequest request,@RequestParam("epFileName") MultipartFile upload) throws IOException {
        int i = 0;
        EasybuyProduct product = new EasybuyProduct();
        String epId = request.getParameter("epId");
        if (epId != null && !epId.equals("")) {
            product.setEpId(Integer.valueOf(epId));
        }
        product.setEpName(request.getParameter("epName"));
        product.setEpDescription(request.getParameter("epDescription"));
        product.setEpPrice(Double.parseDouble(request.getParameter("epPrice")));
        product.setEpStock(Integer.parseInt(request.getParameter("epStock")));
        product.setEpcChildId(Integer.parseInt(request.getParameter("epcChildId")));

        String serverpath = request.getServletContext().getRealPath("/");
        System.out.println(serverpath);
        String path = "upload/images/";
        String pathtmp = "upload/imagestmp/";
        File file = new File(serverpath + path);
        File filetmp = new File(serverpath + pathtmp);
        if (!file.isDirectory()) {
            file.mkdirs();
        }
        if (!filetmp.isDirectory()) {
            filetmp.mkdirs();
        }
        // 获取上传文件项名称,做文件名称随机处理避免上传相同文件名覆盖
        String uuid = UUID.randomUUID().toString().replace("-", "");
        String originalFilename = upload.getOriginalFilename();

        if (originalFilename != null && !originalFilename.equals("")) {
            String fileName = uuid + "_" + upload.getOriginalFilename();
            // 这里是upload.getOriginalFilename()而不是upload.getName()后者只是得到文件项的名字
            upload.transferTo(new File(serverpath + path, fileName));
            product.setEpFileName(path + fileName);
        }
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
