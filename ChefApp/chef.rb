class Chef
  attr_accessor: :current_dishes
      def initialize
        @current_dishes = []
      end

      def add(dish_name)
        @current_dishes.push(dish_name)
      end

      def remove(dish_name)
        @current_dishes.delete(dish_name)
      end

      def current_dishes
        @current_dishes.each do |el| 
          puts el 
        end
      end
end