require_relative 'Dish'
class Chef
  attr_accessor :current_dishes
      def initialize(dishes=[])
        @current_dishes = dishes
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

