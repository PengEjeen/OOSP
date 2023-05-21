package oosp;

public class ReviewWrite { // 리뷰 작성을 위한 빈즈 class
	private String review;
	private String rating;
	private int buyingno;
	
	public ReviewWrite() {
	}
	
	public ReviewWrite(String review,String rating) {
		this.review = review;
		this.rating = rating;
	}
	
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getRating() {
		return rating;
	}
	
	public int getBuyingno() {
		return buyingno;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}
	public void setBuyingno(int buyingno) {
		this.buyingno = buyingno;
	}
}
