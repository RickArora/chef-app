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
          add()
        elsif input == 'r'
          remove()
        elsif input == 'd'
          current_dishes_list()
        elsif input == 'q'
          return 
        else puts "invalid input please pick a valid option"
        end
      end

      def add()
        puts "input the name of your new dish \n"
        dish_to_add = gets.chomp
        @current_dishes.push(Dish.new(dish_to_add))
        puts "dish added: " + dish_to_add
      end

      def remove()
        puts "input the name of the dish you wish to remove \n"
        name_of_dish_to_remove = gets.chomp
        result_of_reject = @current_dishes.reject! { |dish| dish.to_s == name_of_dish_to_remove }
        if result_of_reject.nil?
          puts "dish did not exist, so no dish removed"
        else
          puts "dish removed: " + name_of_dish_to_remove
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


chef = Chef.new()
chef.get_input
