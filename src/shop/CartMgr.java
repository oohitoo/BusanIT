package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Hashtable;

public class CartMgr {
	
	private Hashtable<Integer, OrderBean> hCart = new Hashtable<>();
		
	//cart Insert
	// ���ο� ��ٱ���
	public void addCart(OrderBean order) {
		int productNo = order.getProductNo();
		int quantity = order.getQuantity(); // �ֹ� ����
		if(quantity > 0) {
			//cart�� ������ ����� ���� �ִٸ�
			if(hCart.containsKey(productNo)) {
				//������ ����� �ֹ� ��ü
				OrderBean temp = hCart.get(productNo);
				//���ο� �ֹ��� ���� + ������ �ֹ� ����
				quantity += temp.getQuantity();
				//order ��ü�� ������ �ֹ� ���� setter
				order.setQuantity(quantity);
				//īƮ�� �ٽ� �����ϸ� ������ �ֹ� ��ü�� ����� �ȴ�.
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
		// ������ Key ���� �����
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
