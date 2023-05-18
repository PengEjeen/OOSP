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
			
			
			//검색창에 입력하면 productnumber 반환하는 함수 SearchResult에 사용됨.
			public static ArrayList<String> getProductnumberBySearch(String search) {
				String sql="select productname from product where productname like ?"; //sql문 like 사용 productname을 가져온다.
				ArrayList<String> product = new ArrayList<String>(); //productnumber를 담는 list 생성.
				
				try {
					PreparedStatement prstmt=con.prepareStatement(sql); //값이 있다면 productnumber list 반환
					prstmt.setString(1,"%"+search+"%");
					ResultSet rs = prstmt.executeQuery();
					
					if(rs.next()) {
						product.add(rs.getString("getProductNameByIsbnproductnumber"));
					}
					
				} catch (SQLException e) {
					product.add("null"); 	//없다면 product 값을 String값 null로 변환
					// TODO Auto-generated catch block
					e.printStackTrace();
					
				}
				return product;
			}
			
			//Productnumber로 가격 반환하는 함수 반환값 String
			public static String getPriceByProductnumber(String productnumber) {
				String sql = "select price from product where productnumber="+ productnumber +";";
				
				try {
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					
					if(rs.next()) {
						int result = rs.getInt(1);
						String price = Integer.toString(result);
						System.out.println(price);
						
						return price;
					}

				}
				catch(SQLException e){
					e.printStackTrace();
					String price = "null";
					System.out.println(price);
					
					return price;
				}
				return null;
			}
			
			//Productnumber로 상품 이름 반환하는 함수 반환값 String
			public static String getProductnameByProductnumber(String productnumber) {
				String sql = "select productname from product where productnumber="+ productnumber +";";
				
				try {
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					
					if(rs.next()) {
						String productname = rs.getString(1);
						System.out.println(productname);
						
						return productname;
					}

				}
				catch(SQLException e){
					e.printStackTrace();
					String productname = "null";
					System.out.println(productname);
					
					return productname;
				}
				return null;
			}
			
			//Productnumber로 rate 반환하는 함수 반환 float
			public static float getRateByProductnumber(String productnumber) {
				//rate = totalstar/starcount
				String sql = "select totalstar/starcount from product where productnumber="+ productnumber +";";
				
				try {
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					
					if(rs.next()) {
						float rate = rs.getInt(1);
						System.out.println(rate);
						
						return rate;
					}

				}
				catch(SQLException e){
					e.printStackTrace();
					float rate = -1;
					System.out.println(rate);
					
					return rate;
				}
				return -1;
			}

			//Productnumber로 회사이름 반환 반환값 String 
			public static String getCompanynameByProductnumber(String productnumber) {
				String sql = "select companyname from product where productnumber="+ productnumber +";";
				
				try {
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					
					if(rs.next()) {
						String companyname = rs.getString(1);
						System.out.println(companyname);
						
						return companyname;
					}

				}
				catch(SQLException e){
					e.printStackTrace();
					String companyname = "null";
					System.out.println(companyname);
					
					return companyname;
				}
				return null;
			}
			
			//productnumber로 재고 반환받는 함수 반환값 int
			public static int getStockByProductnumber(String productnumber) {
				String sql = "select stock from product where productnumber="+ productnumber +";";
				
				try {
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					
					if(rs.next()) {
						int stock = rs.getInt(1);
						System.out.println(stock);
						
						return stock;
					}

				}
				catch(SQLException e){
					e.printStackTrace();
					int stock = -1;
					System.out.println(stock);
					
					return stock;
				}
				return -1;
			}
			
			public static void main(String[] args) {
				DB.loadConnect();
				getStockByProductnumber("111");
			}
			
}