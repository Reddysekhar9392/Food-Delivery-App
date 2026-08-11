package com.Foodiee.utility;

import com.Foodiee.DAOImpl.MenuDAOImpl;
import com.Foodiee.model.Menu;

import java.time.LocalTime;

public class Test {

	public static void main(String[] args) {

		MenuDAOImpl dao = new MenuDAOImpl();

		dao.addMenu(new Menu(0, 1, "Classic Mixed Ice Cream", "Ice Cream",
			    "A delightful combination of vanilla, chocolate, and strawberry ice cream served with chocolate syrup.",
			    199.00, true, "images/classic-mixed-ice-cream.jpg", 4.9, 1800, 480, 5, "Veg", 1));

		
		System.out.println("Menu items inserted successfully.");
	}
}