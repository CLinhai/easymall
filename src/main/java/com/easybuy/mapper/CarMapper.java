package com.easybuy.mapper;

import com.easybuy.entity.Car;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CarMapper {
    int deleteByPrimaryKey(Integer carId);

    int insert(Car record);

    Car selectByPrimaryKey(Integer carId);

    List<Car> selectAll();

    int updateByPrimaryKey(Car record);

    List<Car> selectByUid(Integer carUid);

    Car selectByUidAndPid(@Param("carUid") Integer carUid,@Param("carPid") Integer carPid);

    int updateCount(@Param("carId") Integer carId, @Param("carQuantity") Integer carQuantity);

    int deleteByIds(String []ids);

    List<Car> selectByIds(String []ids);
}