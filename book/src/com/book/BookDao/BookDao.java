package com.book.BookDao;

import java.util.List;

import com.book.entity.Book;
import com.book.entity.BookColor;
import com.book.entity.User;

public interface BookDao {
	//��ȡ����ͼ��
	public List<Book> getAllBook();
	//����id����
	public void findBook(Book bk);
	//���Ҹ�����Ϣ
	public List<BookColor> getBookColor();
	//���빺�ﳵ
	public boolean AddShoppingCar(Book bk);
	//ɾ�����ﳵ��Ʒ
	public boolean delSBookByBid(int id);
	//��ȡ���ﳵ��Ϣ
	public List<Book> getShoppingCar(User u);
	//�����ظ����
	public boolean cheackShoppingCar(String bookname,String username);
	//��չ��ﳵ
	public boolean ClearShoppingCar(User u);

}
