package com.easybuy.service.imp;

import com.easybuy.entity.*;
import com.easybuy.mapper.*;
import com.easybuy.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CartServiceImpl implements CartService {
    @Autowired
    private EasybuyProductCategoryMapper easybuyProductCategoryMapper;
    @Autowired
    private EasybuyProductMapper easybuyProductMapper;
    @Autowired
    private EasybuyCommentMapper easybuyCommentMapper;
    @Autowired
    private EasybuyNewsMapper easybuyNewsMapper;
    @Autowired
    private EasybuyOrderDetailMapper easybuyOrderDetailMapper;
    @Autowired
    private EasybuyUserMapper easybuyUserMapper;
    @Autowired
    private  EasybuyOrderMapper easybuyOrderMapper;
    @Autowired
    private  CarMapper carMapper;

    @Override
    public int cartAdd(int epId,int count,int uid) {
        Car oldCar= this.carMapper.selectByUidAndPid(uid, epId);
        int i=0;
        if (oldCar!=null){
            Integer oldCount = oldCar.getCarQuantity();
            Integer newCount=oldCount+count;
            i=this.carMapper.updateCount(oldCar.getCarId(), newCount);
        }else{
            EasybuyProduct product = this.easybuyProductMapper.selectByPrimaryKey(epId);
            Car car=new Car();
            car.setCarPfilename(product.getEpFileName());
            car.setCarPid(product.getEpId());
            car.setCarPname(product.getEpName());
            car.setCarPprice(product.getEpPrice());
            car.setCarPstock(product.getEpStock());
            car.setCarQuantity(count);
            car.setCarUid(uid);
            car.setCarValid(1);
             i = this.carMapper.insert(car);
        }

        return i;
    }

    @Override
    public List getCart(int uid) {
        return this.carMapper.selectByUid(uid);
    }

    @Override
    public int cartNumUpdate(int carId, int count) {
        return this.carMapper.updateCount(carId, count);
    }

    @Override
    public int deleteCarts(String[] ids) {

        return this.carMapper.deleteByIds(ids);
    }

    @Override
    public int deleteByPrimaryKey(int carId) {
        return this.carMapper.deleteByPrimaryKey(carId);
    }

    @Override
    public Map toOrder(String[] ids, int uid) {
        Map map=new HashMap();
        List<Car> list = this.carMapper.selectByIds(ids);
        map.put("list", list);
        EasybuyUser user = this.easybuyUserMapper.selectByPrimaryKey(uid);
        map.put("user", user);
        return map;
    }

    @Override
    public int submitOrder(String ids[], EasybuyOrder easybuyOrder) {
        int i = this.easybuyOrderMapper.insert(easybuyOrder);
        List<Car> carts = this.carMapper.selectByIds(ids);
        for (Car cart : carts) {
            EasybuyOrderDetail orderDetail=new EasybuyOrderDetail();
            orderDetail.setEoId(easybuyOrder.getEoId());
            orderDetail.setEpId(cart.getCarPid());
            orderDetail.setEodQuantity(cart.getCarQuantity());
            orderDetail.setEodCost(cart.getCarPprice());
            orderDetail.setEodSubtotal(cart.getCarPprice()*cart.getCarQuantity());
            int i1 = this.easybuyOrderDetailMapper.insert(orderDetail);
            int i2 = this.easybuyProductMapper.updateStock(cart.getCarPid(), cart.getCarQuantity());
            int i3 = this.carMapper.deleteByIds(ids);

        }
        return i;
    }
}
