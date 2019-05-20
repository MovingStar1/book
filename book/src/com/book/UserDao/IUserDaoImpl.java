package com.book.UserDao;

import java.sql.SQLException;

import com.book.entity.User;
import com.book.jdbc.sql_data;

public class IUserDaoImpl extends sql_data implements UserDao {
    //注册
	public boolean User_Reg(User u) {
		boolean flag=false;
		conn=sql_data.getConnection();
		String sql="insert into User(username,password,phonenumber)value(?,?,?)";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, u.getUsername());
			pst.setString(2, u.getPassword());
			pst.setString(3, u.getPhonenumber());
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
    //登陆
	public boolean User_login(User u) {
		boolean flag=false;
		conn=sql_data.getConnection();
		String sql="select*from user where username=? and password=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, u.getUsername());
			pst.setString(2, u.getPassword());
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
	//验证用户
	public boolean User_exiter(String username) {
		boolean flag=false;
		conn=sql_data.getConnection();
		String sql="select*from user where username=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, username);
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
	//消费
	public boolean User_Xiaofei(int money,User u) {
		boolean flag=false;
		conn=sql_data.getConnection();
		String sql="update money set money=? where username=?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, money);
			pst.setString(2, u.getUsername());
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
