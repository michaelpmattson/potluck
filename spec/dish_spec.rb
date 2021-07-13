require './lib/dish'

RSpec.describe Dish do
  context '#initialize' do
    it 'exists' do
      dish = Dish.new("Couscous Salad", :appetizer)

      expect(dish).to be_instance_of(Dish)
    end
  end
end
