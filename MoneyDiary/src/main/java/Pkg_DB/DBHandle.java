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
			
			e.printStackTrace(); // ������ ���� �̷��� �ᵵ �Ǵµ� client ��������Ǿ� �� ���� �˷���� ��� �ڵ��ؾ� �ؿ�
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		//return this.con;
	}
	
	// inline Query���� select(ResultSet �ʿ�), delete, update, insert
	
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
	
	// insert, delete, update inline Query ��� �� 
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
	
	// 1. procedure�� Ȱ���� output paramenter �� �������� ����
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
	
	// 2. �����ϴ� ��� ResultSet = output Cursor �� ��츸
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
