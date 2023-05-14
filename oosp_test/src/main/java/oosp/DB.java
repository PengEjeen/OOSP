package oosp;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.math.BigInteger;
public class DB {
	
			static  Connection con         = null;
			static  Statement stmt         = null;
			static  ResultSet rs           = null ;
			
			static String driver= "com.mysql.jdbc.Driver";
			static String URL = "jdbc:mysql://localhost:3306/oosp" ;
			
			public static void loadConnect()  {
				try {
					// 
					if( stmt != null ) stmt.close();
					if( con != null ) con.close();
				} catch (SQLException ex ) {};  

				// ����̹� �ε�
				try {
					Class.forName(driver);

				} catch ( java.lang.ClassNotFoundException e ) {
					System.err.println("** Driver loaderror in loadConnect: " + e.getMessage() );
					e.printStackTrace();

				}

				try {

					// �����ϱ�
					con  = DriverManager.getConnection(URL, "root", "onlyroot");

					System.out.println("\n"+URL+"�� �����");


				} catch( SQLException ex ) 
				{

					System.err.println("** connection error in loadConnect(): " + ex.getMessage() );
					ex.printStackTrace();
				}	   

			}
			
			//�� ȸ������
			public static int insertCustomer(String id,String name,int age,String adress,String password) {
				String sql="insert into customer values('"+id+"','"+name+"','"+age+"','"+adress+"','"+password+"','0','0')";
				System.out.println("   >> SQL : " + sql + "\n");
				
				try {
					Statement stmt =con.createStatement();
					return stmt.executeUpdate(sql);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					return 0;
				}
				
			}
			
			//��й�ȣ ��ȣȭ
			public static String encriptPassword(String password) {
				if (password==null || password.equals(""))
					return "1Ew$H6KhfKHJHG";			
			
				return "" + password.hashCode();  // Java�� hashCode() �޼ҵ带 �̿��� ���� ������ ��ȣȭ
			}
			
			//ID�� ㅇㄹ
			public static String getPasswordById(String id) {
				String sql="select pw from customer where id='"+id+"'";
				
				try {
					Statement stmt =con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
					String pw =rs.getString(1);
					return pw;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					String error ="����!!";
					return error;
				}
				return null;			
			}
			
}