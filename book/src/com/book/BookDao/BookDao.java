package com.book.BookDao;

import java.util.List;

import com.book.entity.Book;
import com.book.entity.BookColor;
import com.book.entity.User;

public interface BookDao {
	//获取所有图书
	public List<Book> getAllBook();
	//根据id查找
	public void findBook(Book bk);
	//查找辅助信息
	public List<BookColor> getBookColor();
	//加入购物车
	public boolean AddShoppingCar(Book bk);
	//删除购物车商品
	public boolean delSBookByBid(int id);
	//获取购物车信息
	public List<Book> getShoppingCar(User u);
	//控制重复添加
	public boolean cheackShoppingCar(String bookname,String username);
	//清空购物车
	public boolean ClearShoppingCar(User u);

}
