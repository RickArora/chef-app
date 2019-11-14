require_relative 'dish'
require 'byebug'
class Chef
  attr_accessor :current_dishes
  def initialize(dishes=[])
    @current_dishes = dishes
  end
  
  def display_menu
    puts "Type: \n 'a' to add a dish \n 'r' to remove a dish \n 'd' to display all dishes \n 's' to search by ingredients \n 'q' to quit the program"
  end
  
  def add_ingredients(dish_name)
    puts "enter the name of the ingredients"
    ingredients_to_add = gets.chomp.split(',')
    dish = @current_dishes.select { |dish| dish.name == dish_name }
    dish[0].ingredients += ingredients_to_add
  end
  
  def get_input
    display_menu
    input = ""
    while(input != 'q')
      input = gets.chomp
      parse_input(input)
      if input != 'q'
        display_menu
      end
    end
  end
  
  def parse_input(input) 
    if input == 'a'
      add
    elsif input == 'r'
      remove
    elsif input == 'd'
      current_dishes_list
    elsif input == 'q'
      return 
    elsif input == 's'
      search_by_ingredient
    else puts "invalid input please pick a valid option"
    end
  end
  
  def search_by_ingredient
    puts "Input list of ingredients to search by: "
    list_of_ingredients_for_search = gets.chomp.split(",")
    dishes_with_ingredients = @current_dishes.select { |dish| (dish.ingredients - list_of_ingredients_for_search).empty? }
    #dishes_with_ingredients = array_difference(dish.ingredients, list_of_ingredients_for_search)
    puts "these are the dishes you can make"
    puts dishes_with_ingredients.join(",")
    byebug
  end
  
  # def array_difference(x, y)
  #   ret = x
  #   y.each do |element|
  #     if index = ret.index(element)
  #       ret.delete_at(index)
  #     end
  #   end
  #   ret
  # end
  
  def add
    puts "input the name of your new dish \n"
    dish_to_add = gets.chomp
    @current_dishes.push(Dish.new(dish_to_add))
    puts "dish added: " + dish_to_add
    add_ingredients(dish_to_add)
  end
  
  def remove
    puts "input the name of the dish you wish to remove \n"
    name_of_dish_to_remove = gets.chomp
    array_with_dish_deleted = @current_dishes.reject! { |dish| dish.to_s == name_of_dish_to_remove }
    if array_with_dish_deleted.nil?
      puts "dish did not exist, so no dish removed"
    else
      puts "dish removed: " + name_of_dish_to_remove
    end
  end
  
  def current_dishes_list
    puts "list of dishes displayed below: \n \n"
    @current_dishes.each do |dish| 
      puts dish.name
      puts "dish ingredients below"
      puts dish.ingredients
    end
    puts "\nYour list of food is displayed above."
  end
end


chef = Chef.new
chef.get_input
