package com.mvc.bean;

public class LocationSizeBean {
	private int locSizeId;
	private int locationId;
	private String locationName;
	private String size;
	private int sizeId;
	private float price;
	private String availabilityStatus;

	// getters and setters

	public int getLocSizeId() {
		return locSizeId;
	}

	public void setLocSizeId(int locSizeId) {
		this.locSizeId = locSizeId;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public int getSizeId() {
		return sizeId;
	}

	public void setSizeId(int sizeId) {
		this.sizeId = sizeId;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getAvailabilityStatus() {
		return availabilityStatus;
	}

	public void setAvailabilityStatus(String availabilityStatus) {
		this.availabilityStatus = availabilityStatus;
	}

}
