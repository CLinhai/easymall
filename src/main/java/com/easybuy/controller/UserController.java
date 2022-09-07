package com.easybuy.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.easybuy.entity.EasybuyNews;
import com.easybuy.entity.EasybuyProduct;
import com.easybuy.entity.EasybuyUser;
import com.easybuy.service.CartService;
import com.easybuy.service.UserService;
import com.easybuy.utils.CodeUtil;
import com.easybuy.utils.VerifyCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private CartService cartService;

    @RequestMapping("/go")
    public String go(String url) {
        return url;
    }

    @RequestMapping("/index")
    public String index(Model model, HttpSession session) {
        Map<String, Object> map = this.userService.index();
        model.addAttribute("map", map);
        session.setAttribute("map", map);
        return "index";
    }

    @RequestMapping("/getVerifyCode")
    public void generate(HttpServletResponse response, HttpSession session) {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        CodeUtil codeUtil = new CodeUtil();
        String verifyCodeValue = codeUtil.drawImg(output);
        System.out.println(verifyCodeValue);
        session.setAttribute("verifyCode", verifyCodeValue);
        try {
            ServletOutputStream out = response.getOutputStream();
            output.writeTo(out);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/getVerifyCode2")
    public void getVerificationCode(HttpServletResponse response, HttpServletRequest request) {

        try {

            int width = 200;

            int height = 69;

            BufferedImage verifyImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

            //生成对应宽高的初始图片

            String randomText = VerifyCode.drawRandomText(width, height, verifyImg);

            //单独的一个类方法，出于代码复用考虑，进行了封装。

            //功能是生成验证码字符并加上噪点，干扰线，返回值为验证码字符

            request.getSession().setAttribute("verifyCode", randomText);

            response.setContentType("image/png");//必须设置响应内容类型为图片，否则前台不识别

            OutputStream os = response.getOutputStream(); //获取文件输出流

            ImageIO.write(verifyImg, "png", os);//输出图片流

            os.flush();

            os.close();//关闭流

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    //检查验证码
    @RequestMapping("/checkVerifyCode")
    public @ResponseBody
    String checkVerifyCode(@RequestBody String body, HttpSession session) throws IOException {
        System.out.println(body);
        //获取json中的值
        JSONObject jsonObject = JSON.parseObject(body);
        String code = jsonObject.getString("code");
        String verifyCode = (String) session.getAttribute("verifyCode");

        if (!code.equalsIgnoreCase(verifyCode)) {
//           response.getWriter().print("1");
            return "0";
        } else {
            return "1";
        }
    }

    @RequestMapping("/checkLogin")
    public @ResponseBody
    String chekLogin(@RequestBody String body, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {

        //获取json中的值
        JSONObject jsonObject = JSON.parseObject(body);

        String euUserLoginid = jsonObject.getString("euUserLoginid");
        String euPassword = jsonObject.getString("euPassword");

        //查询用户的登录信息是否正确
        EasybuyUser user = this.userService.checkLoginOrRegister(euUserLoginid);
        System.out.println(user);
        if (user != null && user.getEuPassword().equals(euPassword) ) {
            session.setAttribute("loginuser", user);
            return "1";
        } else {
            return "0";
        }


    }

    @RequestMapping("/checkRegister")
    public @ResponseBody String checkRegister(@RequestBody String body) {
        System.out.println(body);
        //获取json中的值
        JSONObject jsonObject = JSON.parseObject(body);
        String euUserLoginid = jsonObject.getString("euUserLoginid");
//        System.out.println(euUserLoginid);
        EasybuyUser user = this.userService.checkLoginOrRegister(euUserLoginid);
        if (user ==null ) {
            return "0";
        } else {
            return "1";
        }
    }

    @RequestMapping("/register")
    public String register(EasybuyUser user,HttpSession session){

        int i = this.userService.register(user);
        if (i==1){
            user.setEuStatus(1);
            session.setAttribute("loginuser", user);
//            System.out.println("aaa------------------------"+user);
            return "redirect:go.do?url=logOrRegResult&type=register";
        }else {
            return "redirect:go.do?url=register&msg=regError";
        }

    }

    @RequestMapping("/exit")
    public String exit(HttpSession session){
        session.removeAttribute("loginuser");
        return "redirect:index.do";
    }
    @RequestMapping("/productListPage")
    public String productListPage(Model model, @RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
                                  @RequestParam(value = "epcChildId",  required = true) Integer epcChildId) {
        Map map = this.userService.productListPage(currentPage, epcChildId);
        model.addAttribute("productMap", map);
        model.addAttribute("products", map.get("products"));
        model.addAttribute("epcChildId", epcChildId);
        model.addAttribute("epcChild",map.get("epcChild"));
        model.addAttribute("epcParent",map.get("epcParent"));
        return "productList";
    }

    @RequestMapping("/getProduct")
    public String getProduct(int epId,HttpServletRequest request,HttpServletResponse response){
        Map pMap = this.userService.getProductById(epId);
        request.setAttribute("pMap",pMap);
        EasybuyProduct product = (EasybuyProduct)pMap.get("product");
        request.setAttribute("product",product );

        String str="";
        Cookie[] cookies = request.getCookies();
        if (cookies!=null){
            for (Cookie cookie : cookies) {
                if ("zjll".equals(cookie.getName())){
                    str=cookie.getValue();
                    break;
                }
            }
        }
        try {
            str= URLDecoder.decode(str,"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String nowProduct=product.getEpId()+"-"+product.getEpName()+"-"+product.getEpFileName();
        if (!"".equals(str)){
            String[] arr = str.split(",");
            str="";
            int x=0;
            for (int i = 0; i <arr.length ; i++) {
                if (!nowProduct.equals(arr[i])){
                    str+=("".equals(str)?"":",")+arr[i];
                    x++;
                }
                if (x==4){
                    break;
                }
            }
        }
        str=nowProduct+(!"".equals(str)?",":"")+str;
        response.setContentType("text/html;charset=utf-8");
        try {
            str= URLEncoder.encode(str, "UTF-8");
            Cookie cookie = new Cookie("zjll", str);
            cookie.setMaxAge(60*60*24*365);
            response.addCookie(cookie);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "product";
    }

    @RequestMapping("/showLL")
    public  String showLL(HttpServletResponse response,HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        String str="";
        for (Cookie cookie : cookies) {
            if ("zjll".equals(cookie.getName())){
                try {
                    str = URLDecoder.decode(cookie.getValue(), "utf-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                break;
            }
        }
        response.setContentType("html/text;charset=utf-8");

        try {
            response.getWriter().print(str);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;

    }

    @RequestMapping("/getNews")
    public String getNews(int enId,Model model){
        EasybuyNews news = this.userService.getNewsById(enId);
        model.addAttribute("news", news);
        return "news";
    }


}
