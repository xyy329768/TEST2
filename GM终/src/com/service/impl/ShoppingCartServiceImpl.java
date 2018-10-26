package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.service.inter.ShoppingCartService;
import com.vo.Product;

public class ShoppingCartServiceImpl implements ShoppingCartService{

	@Override
	public void addToCart(HttpSession session, Product product) {
		List<Product> list = (List<Product>)session.getAttribute("shoppingCart");
		if(list==null){//��һ������
			list = new ArrayList<Product>();
			list.add(product);
		}else{//�ڶ���
			int pid = product.getPid();
		
			boolean ifBeforeBuy=false;
			for(Product oldproduct:list){
				if(oldproduct.getPid()==pid){
					oldproduct.setShoppingCarSum(oldproduct.getShoppingCarSum()+product.getShoppingCarSum());
					ifBeforeBuy = true;
					break;
				}
			}
			if(!ifBeforeBuy){
				System.out.println("֮ǰû�����");
				list.add(product);
			}
			
		}
		session.setAttribute("shoppingCart", list);
	}

}
