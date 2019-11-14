# frozen_string_literal: true

require_relative 'dish'
require 'byebug'
class Chef
  attr_accessor :current_dishes
  def initialize(dishes = [])
    @current_dishes = dishes
  end

  def display_menu
    puts "Type: \n 'a' to add a dish \n 'r' to remove a dish \n 'd' to display all dishes \n 's' search by ingredient \n 'i' to add ingredients to a dish \n 'q' to quit the program"
  end

  def get_input
    display_menu
    input = ''
    while input != 'q'
      input = gets.chomp
      parse_input(input)
      display_menu if input != 'q'
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
      nil
    elsif input == 'i'
      add_ingredients
    elsif input == 's'
      search_dish_by_ingredient
    else puts 'invalid input please pick a valid option'
    end
  end

  def add_ingredients
    p 'input the dish you wish to add ingredients to below'
    dish_to_add_ingredients_to = gets.chomp
    dishes_matching_input = @current_dishes.select { |dish| dish.name == dish_to_add_ingredients_to }
    if dishes_matching_input != []
      p 'input your ingredients seperated by a comma below'
      ingredients_to_add = gets.chomp.split(',')
      dishes_matching_input[0].ingredients += ingredients_to_add
    else
      p 'no dish matching that name exists'
    end
  end

  def search_dish_by_ingredient
    p "put the ingredients you want to search by below: "
    ingredients_to_search_by = gets.chomp.split(',')
    dishes_with_ingredients = @current_dishes.select { |dish| ((ingredients_to_search_by - (dish.ingredients)).empty?) }
    p "your dishes are posted below: "
    p dishes_with_ingredients.join(", ")
    debugger
  end

  def add
    puts "input the name of your new dish \n"
    dish_to_add = gets.chomp
    @current_dishes.push(Dish.new(dish_to_add))
    puts 'dish added: ' + dish_to_add
  end

  def remove
    puts "input the name of the dish you wish to remove \n"
    name_of_dish_to_remove = gets.chomp
    array_with_dish_deleted = @current_dishes.reject! { |dish| dish.to_s == name_of_dish_to_remove }
    if array_with_dish_deleted.nil?
      puts 'dish did not exist, so no dish removed'
    else
      puts 'dish removed: ' + name_of_dish_to_remove
    end
  end

  def current_dishes_list
    puts "list of dishes displayed below: \n \n"
    @current_dishes.each do |dish|
      puts dish.name
    end
    puts "\nYour list of food is displayed above."
  end
end

chef = Chef.new
chef.get_input
