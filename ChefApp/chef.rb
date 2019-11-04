require_relative 'Dish'
class Chef
  attr_accessor :current_dishes
      def initialize(dishes=[])
        @current_dishes = dishes
        @get_input
      end

      def get_input()
        input = puts "Type: \n 'a' to add a dish \n 'r' to remove a dish \n 'd' to display all dishes \n 'q' to quit the program"
        while(input != 'q')
          parse_input(input)
        end
      end

      def parse_input(input) 
        if input == 'a'
          p "input the name of your new dish \n"
          name_of_new_dish = gets
          add(name_of_new_dish)
        elsif input == 'r'
          p "input the name of the dish you wish to remove \n"
          name_of_dish_to_remove = gets
          remove(name_of_dish_to_remove)
        elsif input == 'd'
          p "list of dishes displayed below: \n"
          @current_dishes_list
        end
      end

      def add(dish_name)
        @current_dishes.push(dish_name)
      end

      def remove(dish_name)
        @current_dishes.delete(dish_name)
      end

      def current_dishes_list
        @current_dishes.each do |dish| 
          puts dish.name 
        end
      end
end

poutine = Dish.new("Poutine")
fish = Dish.new("Fish")
arr = []
arr.push(poutine)
arr.push(fish)
chef = Chef.new(arr)
chef.current_dishes_list

