package com.Foodiee.model;

public class Menu {
	
	private int menu_id;
    private int restaurant_id;
    private String food_name;
    private String category;
    private String description;
    private double price;
    private boolean is_available;
    private String imagePath;
    private double rating;
    private int review_count;
    private int calories;
    private int preparation_time;
    private String food_type;
    private int discount;
    
    public Menu() {
		// TODO Auto-generated constructor stub
	}

	public Menu(int restaurant_id, String food_name, String category, String description, double price,
			boolean is_available, String imagePath, double rating, int review_count, int calories, int preparation_time,
			String food_type, int discount) {
		super();
		this.restaurant_id = restaurant_id;
		this.food_name = food_name;
		this.category = category;
		this.description = description;
		this.price = price;
		this.is_available = is_available;
		this.imagePath = imagePath;
		this.rating = rating;
		this.review_count = review_count;
		this.calories = calories;
		this.preparation_time = preparation_time;
		this.food_type = food_type;
		this.discount = discount;
	}

	public Menu(int menu_id, int restaurant_id, String food_name, String category, String description, double price,
			boolean is_available, String imagePath, double rating, int review_count, int calories, int preparation_time,
			String food_type, int discount) {
		super();
		this.menu_id = menu_id;
		this.restaurant_id = restaurant_id;
		this.food_name = food_name;
		this.category = category;
		this.description = description;
		this.price = price;
		this.is_available = is_available;
		this.imagePath = imagePath;
		this.rating = rating;
		this.review_count = review_count;
		this.calories = calories;
		this.preparation_time = preparation_time;
		this.food_type = food_type;
		this.discount = discount;
	}

	public int getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}

	public int getRestaurant_id() {
		return restaurant_id;
	}

	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public boolean isIs_available() {
		return is_available;
	}

	public void setIs_available(boolean is_available) {
		this.is_available = is_available;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public int getReview_count() {
		return review_count;
	}

	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}

	public int getCalories() {
		return calories;
	}

	public void setCalories(int calories) {
		this.calories = calories;
	}

	public int getPreparation_time() {
		return preparation_time;
	}

	public void setPreparation_time(int preparation_time) {
		this.preparation_time = preparation_time;
	}

	public String getFood_type() {
		return food_type;
	}

	public void setFood_type(String food_type) {
		this.food_type = food_type;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	@Override
	public String toString() {
		return "Menu [menu_id=" + menu_id + ", restaurant_id=" + restaurant_id + ", food_name=" + food_name
				+ ", category=" + category + ", description=" + description + ", price=" + price + ", is_available="
				+ is_available + ", imagePath=" + imagePath + ", rating=" + rating + ", review_count=" + review_count
				+ ", calories=" + calories + ", preparation_time=" + preparation_time + ", food_type=" + food_type
				+ ", discount=" + discount + "]";
	}    

}
