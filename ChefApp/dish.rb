# frozen_string_literal: true

class Dish
  attr_accessor :name, :ingredients

  def initialize(name)
    @name = name
    @ingredients = []
  end

  def to_s
    @name
  end
end
