require './lib/dish'
require './lib/potluck'

RSpec.describe Potluck do
  context '#initialize' do
    it 'exists' do
      potluck = Potluck.new("7-13-18")

      expect(potluck).to be_instance_of(Potluck)
    end

    it 'has a date' do
      potluck = Potluck.new("7-13-18")

      expect(potluck.date).to eq("7-13-18")
    end

    it 'has an empty dishes array' do
      potluck = Potluck.new("7-13-18")

      expect(potluck.dishes).to eq([])
    end
  end

  context '#add_dishes' do
    it 'adds dishes to dishes array' do
      potluck = Potluck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

      expect(potluck.dishes).to eq([])

      potluck.add_dish(couscous_salad)
      potluck.add_dish(cocktail_meatballs)

      expect(potluck.dishes).to eq([couscous_salad, cocktail_meatballs])
    end
  end
end
