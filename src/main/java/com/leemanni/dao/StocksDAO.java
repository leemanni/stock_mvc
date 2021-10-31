package com.leemanni.dao;

import java.util.ArrayList;

import com.leemanni.vo.LoginVO;
import com.leemanni.vo.UserStocksVO;

public interface StocksDAO {


	int loginOK(LoginVO loginVO);

	ArrayList<UserStocksVO> selectList();

	int insertOK(String name);

	void insert(UserStocksVO stocksVO);

	UserStocksVO selectStock(String parameter);

	void update(UserStocksVO stocksVO);

	void delete(String name);


}
