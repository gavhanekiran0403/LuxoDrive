package com.luxodrive.model;

import java.util.List;

public class Car {

	private int carId;
	private String modelName;
	private String carNo;
	private String fuelType;
	private int seats;
	private double rent;
	private int carYearModel;
	private String insuranceNo;
	private String features;
	private String status;
	private List<byte[]> images;
	private CarOwner carOwner;

	public Car() {
		super();

	}

	public Car(int carId, String modelName, String carNo, String fuelType, int seats, double rent, int carYearModel,
			String insuranceNo, String features, String status, List<byte[]> images, CarOwner carOwner) {
		super();
		this.carId = carId;
		this.modelName = modelName;
		this.carNo = carNo;
		this.fuelType = fuelType;
		this.seats = seats;
		this.rent = rent;
		this.carYearModel = carYearModel;
		this.insuranceNo = insuranceNo;
		this.features = features;
		this.status = status;
		this.images = images;
		this.carOwner = carOwner;
	}

	public int getCarId() {
		return carId;
	}

	public void setCarId(int carId) {
		this.carId = carId;
	}

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}

	public String getFuelType() {
		return fuelType;
	}

	public void setFuelType(String fuelType) {
		this.fuelType = fuelType;
	}

	public int getSeats() {
		return seats;
	}

	public void setSeats(int seats) {
		this.seats = seats;
	}

	public double getRent() {
		return rent;
	}

	public void setRent(double rent) {
		this.rent = rent;
	}

	public int getCarYearModel() {
		return carYearModel;
	}

	public void setCarYearModel(int carYearModel) {
		this.carYearModel = carYearModel;
	}

	public String getInsuranceNo() {
		return insuranceNo;
	}

	public void setInsuranceNo(String insuranceNo) {
		this.insuranceNo = insuranceNo;
	}

	public String getFeatures() {
		return features;
	}

	public void setFeatures(String features) {
		this.features = features;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<byte[]> getImages() {
		return images;
	}
	
	public void setImages(List<byte[]> images) {
		this.images = images;
	}
	
	public CarOwner getCarOwner() {
		return carOwner;
	}

	public void setCarOwner(CarOwner carOwner) {
		this.carOwner = carOwner;
	}

	@Override
	public String toString() {
		return "Car [carId=" + carId + ", modelName=" + modelName + ", carNo=" + carNo + ", fuelType=" + fuelType
				+ ", seats=" + seats + ", rent=" + rent + ", carYearModel=" + carYearModel + ", insuranceNo="
				+ insuranceNo + ", features=" + features + ", status=" + status + ", images=" + images+ ", carOwner=" + carOwner+ "]";
	}

}
