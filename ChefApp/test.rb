module Ingredients
  module_function

  def missing_ingredients(recipe:, on_hand:)

  end
end

require 'minitest/autorun'

describe Ingredients do
  include Ingredients

  describe '::missing_ingredients' do
    it 'is empty if both are emtpy' do
      assert_equal [], missing_ingredients(recipe: [] , on_hand: [])
    end
  end
end