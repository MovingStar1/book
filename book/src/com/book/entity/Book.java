package com.book.entity;

import java.util.Date;

public class Book {
	private int bid;
	private String bookname;
	private String booktitle;
	private String bookauthor;
	private double bookpress;
	private Date presstime;
	private String imgsrc;
	private String username;
	private String bookcolor;
	public Book() {
		// TODO Auto-generated constructor stub
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getBooktitle() {
		return booktitle;
	}
	public void setBooktitle(String booktitle) {
		this.booktitle = booktitle;
	}
	public String getBookauthor() {
		return bookauthor;
	}
	public void setBookauthor(String bookauthor) {
		this.bookauthor = bookauthor;
	}
	public double getBookpress() {
		return bookpress;
	}
	public void setBookpress(double bookpress) {
		this.bookpress = bookpress;
	}
	public Date getPresstime() {
		return presstime;
	}
	public void setPresstime(Date presstime) {
		this.presstime = presstime;
	}
	public String getImgsrc() {
		return imgsrc;
	}
	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBookcolor() {
		return bookcolor;
	}
	public void setBookcolor(String bookcolor) {
		this.bookcolor = bookcolor;
	}
	public Book(int bid, String bookname, String booktitle, String bookauthor,
			double bookpress, Date presstime, String imgsrc, String username,
			String bookcolor) {
		super();
		this.bid = bid;
		this.bookname = bookname;
		this.booktitle = booktitle;
		this.bookauthor = bookauthor;
		this.bookpress = bookpress;
		this.presstime = presstime;
		this.imgsrc = imgsrc;
		this.username = username;
		this.bookcolor = bookcolor;
	}
	@Override
	public String toString() {
		return "Book [bid=" + bid + ", bookname=" + bookname + ", booktitle="
				+ booktitle + ", bookauthor=" + bookauthor + ", bookpress="
				+ bookpress + ", presstime=" + presstime + ", imgsrc=" + imgsrc
				+ ", username=" + username + ", bookcolor=" + bookcolor + "]";
	}
	

}
