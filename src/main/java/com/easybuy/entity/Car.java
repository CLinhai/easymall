package com.easybuy.entity;

public class Car {
    private Integer carId;

    private String carPfilename;

    private String carPname;

    private Integer carQuantity;

    private Integer carPstock;

    private Integer carPid;

    private Integer carUid;

    private Integer carValid;

    private Double carPprice;

    public Integer getCarId() {
        return carId;
    }

    public void setCarId(Integer carId) {
        this.carId = carId;
    }

    public String getCarPfilename() {
        return carPfilename;
    }

    public void setCarPfilename(String carPfilename) {
        this.carPfilename = carPfilename == null ? null : carPfilename.trim();
    }

    public String getCarPname() {
        return carPname;
    }

    public void setCarPname(String carPname) {
        this.carPname = carPname == null ? null : carPname.trim();
    }

    public Integer getCarQuantity() {
        return carQuantity;
    }

    public void setCarQuantity(Integer carQuantity) {
        this.carQuantity = carQuantity;
    }

    public Integer getCarPstock() {
        return carPstock;
    }

    public void setCarPstock(Integer carPstock) {
        this.carPstock = carPstock;
    }

    public Integer getCarPid() {
        return carPid;
    }

    public void setCarPid(Integer carPid) {
        this.carPid = carPid;
    }

    public Integer getCarUid() {
        return carUid;
    }

    public void setCarUid(Integer carUid) {
        this.carUid = carUid;
    }

    public Integer getCarValid() {
        return carValid;
    }

    public void setCarValid(Integer carValid) {
        this.carValid = carValid;
    }

    public Double getCarPprice() {
        return carPprice;
    }

    public void setCarPprice(Double carPprice) {
        this.carPprice = carPprice;
    }
}