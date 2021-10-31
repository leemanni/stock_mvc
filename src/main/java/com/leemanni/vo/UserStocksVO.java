package com.leemanni.vo;

/**
 * @author cjffy
 *	회원별 보유 주식 1건의 데이터를 기억하는 클래스
 */
public class UserStocksVO {
	private String name;
	private int ownStocks;
	private int pPrice;	// 구매 가격
	private int cPrice;	// 현재 가격
	private float ratio;		// 수익률(DB x)
	private int totalPrice;	// 자산가치(DB x)
	private int p_totalPrice;	// 구매기준 자산가치(DB x)
	
	
	public UserStocksVO() {;}


	/**
	 * @param ownStocks
	 * @param p_price
	 * @param c_price
	 * @result 수익률 및 자산 가치 계산
	 * 	
	 */
	public void calculate() {
		totalPrice = ownStocks * cPrice;
		p_totalPrice = ownStocks * pPrice;
		ratio = (float)(cPrice - pPrice) / pPrice;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getOwnStocks() {
		return ownStocks;
	}


	public void setOwnStocks(int ownStocks) {
		this.ownStocks = ownStocks;
	}


	public int getpPrice() {
		return pPrice;
	}


	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}


	public int getcPrice() {
		return cPrice;
	}


	public void setcPrice(int cPrice) {
		this.cPrice = cPrice;
	}


	public float getRatio() {
		return ratio;
	}


	public void setRatio(float ratio) {
		this.ratio = ratio;
	}


	public int getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	public int getP_totalPrice() {
		return p_totalPrice;
	}


	public void setP_totalPrice(int p_totalPrice) {
		this.p_totalPrice = p_totalPrice;
	}


	@Override
	public String toString() {
		return "UserStocksVO [name=" + name + ", ownStocks=" + ownStocks + ", pPrice=" + pPrice + ", cPrice=" + cPrice
				+ ", ratio=" + ratio + ", totalPrice=" + totalPrice + ", p_totalPrice=" + p_totalPrice + "]";
	}

	
}
