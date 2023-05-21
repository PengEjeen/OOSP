package oosp;
import java.util.*;
import oosp.Date;

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
					System.err.println(e.getMessage());
					
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
					System.err.println(e.getMessage());
					
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
					System.err.println(e.getMessage());
					
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
					System.err.println(e.getMessage());
					
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
					System.err.println(e.getMessage());
					
					return stock;
				}
				return -1;
			}
			
			//review 쓸 때 사용하는 함수
			public static int inputReview(String rating,String review, String customerid, String productnumber) {
				int year,month,day;
				year = Date.getYear();
				month = Date.getMonth();
				day = Date.getDay();
				
				String sql = "update buying set starreview = "+rating+", review = '"+review+"', orderdate = '"+year+"-"+month+"-"+day+"' "
						+ " where customerid = '"+customerid+"' && productnumber = "+productnumber+"";
				return updateQuery(sql);
			}
			
			//sql 쿼리문 넣고 반환 성공결과 받는 함수. 오류 시 -1 반환
			public static int updateQuery(String sql) { 
				int count;

				try {
					stmt = con.createStatement();
					count = stmt.executeUpdate(sql);  
					return count;
				} catch( SQLException ex ) 	    {
					System.err.println("** SQL exec error in updateQuery() : " + ex.getMessage() );
					return -1;
				}
			}
			
			//물품 구매에 사용하는 함수 BuyAction에 들어가며 성공유무를 int로 반환한다.
			public static int buyingStep(String productnumber,String customerid,String price) { //구매처리 메소드
				int year,month,day;
				year = Date.getYear();
				month = Date.getMonth();
				day = Date.getDay();
				
				updateStock(productnumber);
				
				String sql="insert into buying  values("+getNextno()+", '"+year+"-"+month+"-"+day+"', "+price+", "+productnumber+", '"+customerid+"', 0, \"배송중\", null, null);";
				
				return updateQuery(sql);
			}
			
			//물품 구매 시 번호 주는 함수
			public static int getNextno() {
				String sql = "select buyingno from buying order by buyingno desc";
				try {
					PreparedStatement prstmt = con.prepareStatement(sql);
					ResultSet rs =  prstmt.executeQuery();
					if(rs.next()) {
						return rs.getInt(1) + 1;
					}
					return 1;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return -1;
			}
			
			//물품 구매 시 재고 하나 줄여주는 함수
			public static int updateStock(String productnumber) {
				int now_stock = getStockByProductnumber(productnumber)-1;
				String sql = "update product set stock = " + now_stock + " where productnumber = " + productnumber + "";

				return updateQuery(sql);
			}
			
			public static ResultSet getReview(String productnumber) {
				String sql = "select customerid,starreview, review, orderdate from buying where productnumber = " + productnumber + ";";
				ResultSet rs = null;
				try {
					Statement stmt = con.createStatement();
					rs = stmt.executeQuery(sql);
					
					return rs;
				}
				catch(SQLException e){
					e.printStackTrace();
					return rs;
				}
			}
			
			public static void main(String[] args) {
				loadConnect();
				getReview("111");
			}
			
}