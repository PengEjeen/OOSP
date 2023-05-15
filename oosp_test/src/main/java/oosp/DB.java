package oosp;
import java.util.*;
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
			static String URL = "jdbc:mysql://localhost:3306/oos" ;
			
			public static void loadConnect()  {
				try {
					// 
					if( stmt != null ) stmt.close();
					if( con != null ) con.close();
				} catch (SQLException ex ) {};  

				// driver connect
				try {
					Class.forName(driver);

				} catch ( java.lang.ClassNotFoundException e ) {
					System.err.println("** Driver loaderror in loadConnect: " + e.getMessage() );
					e.printStackTrace();

				}
				//DB connect
				try {

					// 
					con  = DriverManager.getConnection(URL, "root", "onlyroot");

					System.out.println("\n"+URL+"success ! ! !");


				} catch( SQLException ex ) 
				{

					System.err.println("** connection error in loadConnect(): " + ex.getMessage() );
					ex.printStackTrace();
				}	   

			}
			
			public static ResultSet getProductDetailByPname(String product) {
				
				
				return rs;
			}
			
			public static ArraryList<String> getIsbnBySearch(String productname) {
				String sql="select * from product where productname like ?";
				
				try {
					PreparedStatement prstmt=con.prepareStatement(sql);
					prstmt.setString(1,"%"+productname+"%");
					ResultSet rs = prstmt.executeQuery();
					ArrayList<String> product = new ArrayList<String>();
					
					if(rs.next()) {
						product.add(rs.getString("getProductNameByIsbnproductnumber"));
						
					return product;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
}