package com.book.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class sql_data {
	protected static Connection conn;
	protected static PreparedStatement pst;
	protected static ResultSet rs;	
	public static Connection getConnection() {
		Context ctx;
		try {
			ctx = new InitialContext();
			DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/book");
			conn=ds.getConnection();
		} catch (Exception e) {
			System.out.println("获取连接失败！");
			e.printStackTrace();
			return conn;
		}
		return conn;
	}

	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void close(PreparedStatement pst) {
		if (pst != null) {
			try {
				pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void close(PreparedStatement pst, Connection conn) {
		close(pst);
		close(conn);
	}

	public static void close(ResultSet rs, PreparedStatement pst,
			Connection conn) {
		close(rs);
		close(pst);
		close(conn);
	}

}
