# 退出登录

![image-20220906091241619](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906091241619.png)

点击退出 先进入UserController中exit方法

![image-20220906091304344](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906091304344.png)

再重定向到index方法中

![image-20220906091553758](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906091553758.png)

service方法查询到首页展示内容![image-20220906091745934](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906091745934.png)

index页面加载完后进入showLL方法(猜测为显示显示个人头像)

![image-20220906092406088](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906092406088.png)

![image-20220906092610637](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906092610637.png)

# 登录

点击登录按钮

![image-20220906092755964](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906092755964.png)

跳转到UserController的go方法中(跳转到login.jsp页面)

![image-20220906092815941](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906092815941.png)

点击验证码(查看相应逻辑)  未发现走控制层逻辑

填写个人信息,点击立即登录

![image-20220906092927437](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906092927437.png)

先跳到UserController层checkVerifyCode方法(校验 验证码)



![image-20220906093618767](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906093618767.png)

验证码校验通过后,校验账号密码,通过后即向session中存放数据	

![image-20220906101513603](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906101513603.png)

验证成功后进入首页

![image-20220906102521019](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906102521019.png)

![image-20220906103048113](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906103048113.png)

# 点击进入后台

![image-20220906103026562](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906103026562.png)

用户管理列表控制器

![image-20220906104201350](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906104201350.png)

商品管理列表控制器

![image-20220906104243261](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906104243261.png)

订单管理列表控制器

![image-20220906104324864](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906104324864.png)

新闻管理列表控制器

![image-20220906104445015](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906104445015.png)

分类管理列表控制器

![image-20220906104515502](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906104515502.png)

点击修改逻辑(修改和添加走的同一页面)

![image-20220906110611749](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906110611749.png)

![image-20220906110554717](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906110554717.png)

根据left里面的逻辑判断

![image-20220906141422815](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906141422815.png)

![image-20220906141517422](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906141517422.png)

提交修改内容

![image-20220906142421790](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906142421790.png)

判断是否注册过(已删)

![image-20220906142559478](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906142559478.png)

处理提交的(修改或更新逻辑)

![image-20220906142758150](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906142758150.png)

获取参数完成后,回到展示列表

![image-20220906143338861](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906143338861.png)

底层serverimpl更新和添加逻辑

![image-20220906143555774](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906143555774.png)

点击新增,进入新增页面,填写信息,点击提交

![image-20220906144002005](https://raw.githubusercontent.com/CLinhai/PicGo/master/img/image-20220906144002005.png)

处理逻辑和修改一样