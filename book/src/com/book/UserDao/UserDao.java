package com.book.UserDao;

import com.book.entity.User;

public interface UserDao {
	//ע��
	public boolean User_Reg(User u);
	//��½
	public boolean User_login(User u);
	//��֤����
	public boolean User_exiter(String username);
	//����
	public boolean User_Xiaofei(int money,User u);

}
