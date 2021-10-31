package com.leemanni.vo;

import java.util.ArrayList;

/**
 * @author cjffy 유저별 주식들을 ArrayList 로 모아주고 전체 자산 과 전체 수익률을 보여주는 VO 클래스
 */
public class UserStockList {
	private ArrayList<UserStocksVO> stockList = new ArrayList<>();
	private int totalAsset;
	private int p_totalAsset;
	private float totalRatio;

	public UserStockList() {
	}

	public ArrayList<UserStocksVO> getStockList() {
		return stockList;
	}

	public void setStockList(ArrayList<UserStocksVO> stockList) {
		this.stockList = stockList;
		calculate(stockList);
	}

	public int getTotalAsset() {
		return totalAsset;
	}

	public void setTotalAsset(int totalAsset) {
		this.totalAsset = totalAsset;
	}

	public float getTotalRatio() {
		return totalRatio;
	}

	public void setTotalRatio(float totalRatio) {
		this.totalRatio = totalRatio;
	}

	private void calculate(ArrayList<UserStocksVO> stockList) {
		for (UserStocksVO vo : stockList) {
			totalAsset += vo.getTotalPrice();
			p_totalAsset += vo.getP_totalPrice();

		}
		totalRatio = (float) (totalAsset - p_totalAsset) / p_totalAsset;
	}

	@Override
	public String toString() {
		return "UserStockList [stockList=" + stockList + ", totalAsset=" + totalAsset + ", p_totalAsset=" + p_totalAsset
				+ ", totalRatio=" + totalRatio + "]";
	}

}
