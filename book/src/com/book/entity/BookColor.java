package com.book.entity;

public class BookColor {
	private int bid;
	private String color;
	public BookColor() {
		// TODO Auto-generated constructor stub
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public BookColor(int bid, String color) {
		super();
		this.bid = bid;
		this.color = color;
	}
	@Override
	public String toString() {
		return "BookColor [bid=" + bid + ", color=" + color + "]";
	}
	

}
