package com.book.BookDao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.book.entity.Book;
import com.book.entity.BookColor;
import com.book.entity.User;
import com.book.jdbc.sql_data;

public class IBookDaoImpl extends sql_data implements BookDao {

	public List<Book> getAllBook() {
		List<Book> list=new ArrayList<Book>();
		Book bk=null;
		conn=sql_data.getConnection();
		String sql="select*from book";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				bk=new Book();
				bk.setBid(rs.getInt(1));
				bk.setBookname(rs.getString(2));
				list.add(bk);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			sql_data.close(rs, pst, conn);
		}
		return list;
	}
//根据id查找
	public void findBook(Book bk) {
		conn=sql_data.getConnection();
		String sql="select*from book where bid=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, bk.getBid());
			rs=pst.executeQuery();
			while(rs.next()){
				bk.setBid(rs.getInt(1));
				bk.setBookname(rs.getString(2));
				bk.setBooktitle(rs.getString(3));
				bk.setBookauthor(rs.getString(4));
				bk.setBookpress(rs.getDouble(5));
				bk.setPresstime(rs.getDate(6));
				bk.setImgsrc(rs.getString(7));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			sql_data.close(rs, pst, conn);
		}
		
	}
	//查找辅助信息
	public List<BookColor> getBookColor() {
		List<BookColor> list=new ArrayList<BookColor>();
		conn=sql_data.getConnection();
		String sql="select*from bookcolor";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				BookColor bc=new BookColor();
				bc.setBid(rs.getInt(1));
				bc.setColor(rs.getString(2));
				list.add(bc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			sql_data.close(rs, pst, conn);
		}
		return list;
	}
	//加入购物车
	public boolean AddShoppingCar(Book bk) {
		boolean flag=false;
		conn=sql_data.getConnection();
		String sql="insert into shoppingcar(bookname,bookprice,imgsrc,username)value(?,?,?,?)";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, bk.getBookname());
			pst.setDouble(2, bk.getBookpress());
			pst.setString(3, bk.getImgsrc());
			pst.setString(4, bk.getUsername());
			int i=pst.executeUpdate();
			if(i>0){
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			sql_data.close(rs, pst, conn);
		}
		return flag;
	}
	//获取购物车信息
	public List<Book> getShoppingCar(User u) {
		List<Book> list=new ArrayList<Book>();
		Book bk=null;
		conn=sql_data.getConnection();
		String sql="select*from shoppingcar where username=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, u.getUsername());
			rs=pst.executeQuery();
			while(rs.next()){
				bk=new Book();
				bk.setBid(rs.getInt(1));
				bk.setBookname(rs.getString(2));
				bk.setBookpress(rs.getDouble(3));
				bk.setImgsrc(rs.getString(4));
				list.add(bk);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			sql_data.close(rs, pst, conn);
		}
		return list;
	}
	//控制重复添加
	public boolean cheackShoppingCar(String bookname,String username) {
		boolean flag=false;
		conn=sql_data.getConnection();
		String sql="select*from shoppingcar where bookname=? and username=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, bookname);
			pst.setString(2, username);
			rs=pst.executeQuery();
			if(rs.next()){
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			sql_data.close(rs, pst, conn);
		}
		return flag;
	}
	//删除商品
	public boolean delSBookByBid(int id) {
		boolean flag=false;
		conn=sql_data.getConnection();
		String sql="delete from shoppingcar where bid=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			int i=pst.executeUpdate();
			if(i>0){
				System.out.println("删除成功");
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	//清空购物车
	public boolean ClearShoppingCar(User u) {
		boolean flag=false;
		conn=sql_data.getConnection();
		String sql="delete from shoppingcar where username=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, u.getUsername());
			int i=pst.executeUpdate();
			if(i>0){
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			sql_data.close(rs, pst, conn);
		}
		return flag;
	}
	
	

}
