package Pkg_DB;

import java.sql.*;

import oracle.jdbc.OracleTypes;

public class DBHandle {

	private String userID;
	private String userPass;
	private String url;
	private String[] dbInfos;
	private Connection con;
	
	public void setDBInfo(String[] dbInfos) {
		
		this.dbInfos = dbInfos;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	public void getConnection() {
		
		/*Connection*/ this.con = null;
		/*
		String userID = "boards";
		String userPass = "1";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		*/
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			this.con = DriverManager.getConnection(dbInfos[0], dbInfos[1], dbInfos[2]);

		} catch (ClassNotFoundException e) {
			
			e.printStackTrace(); // 개발할 때는 이렇게 써도 되는데 client 직접실행되야 할 때는 알려줬던 대로 코딩해야 해요
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		//return this.con;
	}
	
	// inline Query에서 select(ResultSet 필요), delete, update, insert
	
	public Statement getStatement() {
		
		getConnection();
		
		Statement stmt = null;
		try {
			stmt = this.con.createStatement();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return stmt;
	}
	
	// insert, delete, update inline Query 사용 시 
	public void executeQuery(String strSql) {
		
		Statement stmt = getStatement();
		
		try {
			stmt.execute(strSql);
			
			this.con.close();
			this.con = null;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
	
	// select
	public ResultSet getResultSet(String strSql) {
		
		Statement stmt = getStatement();
		ResultSet rs = null;
		
		try {
			rs = stmt.executeQuery(strSql);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return rs;
	}
	
	// 1. procedure을 활용한 output paramenter 의 존재하지 않음
	public void executeQuery(String strProcName, String[] strPrams) {
		
		getConnection();
		
		try {
			CallableStatement csmt = this.con.prepareCall(strProcName);
			
			for(int i=0;i<strPrams.length;i++) {
				csmt.setString(i+1, strPrams[i]);
			}
			
			csmt.execute();
			
			this.con.close();
			this.con = null;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} 
		
	}
	
	// 2. 존재하는 경우 ResultSet = output Cursor 인 경우만
	public ResultSet getResultSet(String strProcName, String[] strPrams) {
		
		getConnection();
		ResultSet rs = null;
		
		try {
			CallableStatement csmt = this.con.prepareCall(strProcName);
			
			int PramsLength = strPrams.length;
			
			for(int i=0;i<PramsLength;i++) {
				csmt.setString(i+1, strPrams[i]);
			}
			
			csmt.registerOutParameter(PramsLength+1, OracleTypes.CURSOR);

			csmt.execute();
			
			rs = (ResultSet)csmt.getObject(PramsLength+1);
			
			//this.con.close();
			//this.con = null;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} 
		
		return rs;
	}
	
	public void setClose() {
		
		if(this.con != null) {
			
			try {
				this.con.close();
				this.con = null;
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
	}
	
}
