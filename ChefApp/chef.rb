require_relative 'Dish'
require 'byebug'
class Chef
  attr_accessor :current_dishes
      def initialize(dishes=[])
        @current_dishes = dishes
      end

      def get_input()
        puts "Type: \n 'a' to add a dish \n 'r' to remove a dish \n 'd' to display all dishes \n 'q' to quit the program"
        input = ""
        while(input != 'q')
          input = gets.chomp
          parse_input(input)
          if input != 'q'
            puts "Type: \n 'a' to add a dish \n 'r' to remove a dish \n 'd' to display all dishes \n 'q' to quit the program"
          end
        end
      end

      def parse_input(input) 
        if input == 'a'
          add(name_of_new_dish)
        elsif input == 'r'
          remove(name_of_dish_to_remove)
        elsif input == 'd'
          current_dishes_list()
        elsif input == 'q'
          return 
        else puts "invalid input please pick a valid option"
        end
      end

      def add(dish_name)
        puts "input the name of your new dish \n"
        name_of_new_dish = gets.chomp
        @current_dishes.push(Dish.new(dish_name))
        puts "dish added: " + dish_name
      end

      def remove(dish_name)
        puts "input the name of the dish you wish to remove \n"
        name_of_dish_to_remove = gets.chomp
        @current_dishes.reject! { |dish| dish.to_s == dish_name }
        puts "dish removed: " + dish_name 
      end

      def current_dishes_list
        puts "list of dishes displayed below: \n"
        @current_dishes.each do |dish| 
          puts dish.name
        end
        puts "\n Your list of food is displayed above"
      end
end


chef = Chef.new()
chef.get_input
