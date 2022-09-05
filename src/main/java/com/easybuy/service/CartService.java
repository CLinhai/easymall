package com.easybuy.service;

import com.easybuy.entity.EasybuyOrder;

import java.util.List;
import java.util.Map;

public interface CartService {
    int cartAdd(int epId,int count,int uid);

    List getCart(int uid);

    int cartNumUpdate(int carId,int count);

    int deleteCarts(String []ids);

    int deleteByPrimaryKey(int carId);

    Map toOrder(String []ids, int uid);

    int submitOrder(String []ids, EasybuyOrder easybuyOrder);
}
