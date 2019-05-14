package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Hashtable;

public class CartMgr {
	
	private Hashtable<Integer, OrderBean> hCart = new Hashtable<>();
		
	//cart Insert
	// 새로운 장바구니
	public void addCart(OrderBean order) {
		int productNo = order.getProductNo();
		int quantity = order.getQuantity(); // 주문 수량
		if(quantity > 0) {
			//cart에 기존에 저장된 것이 있다면
			if(hCart.containsKey(productNo)) {
				//기존에 저장된 주문 객체
				OrderBean temp = hCart.get(productNo);
				//새로운 주문의 수량 + 기존의 주문 수량
				quantity += temp.getQuantity();
				//order 객체에 합쳐진 주문 수량 setter
				order.setQuantity(quantity);
				//카트에 다시 저장하면 기존에 주문 객체는 덮어쓰기 된다.
				hCart.put(productNo, order);
			}
			else {
				hCart.put(productNo, order);
			}
		}
	}
	
	//cart update
	public void updateCart(OrderBean order) {
		int productNo = order.getProductNo();
		// 동일한 Key 값은 덮어쓰기
		hCart.put(productNo, order);
	}
	//cart delete
	public void deleteCart(OrderBean order) {
		int productno = order.getProductNo();
		hCart.remove(productno);
	}
	//cart list
	public Hashtable<Integer, OrderBean> getCartList(){
		return hCart;
	}
}
