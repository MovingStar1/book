package com.book.UserDao;

import com.book.entity.User;

public interface UserDao {
	//注册
	public boolean User_Reg(User u);
	//登陆
	public boolean User_login(User u);
	//验证存在
	public boolean User_exiter(String username);
	//消费
	public boolean User_Xiaofei(int money,User u);

}
