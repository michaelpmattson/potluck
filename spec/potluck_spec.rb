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

  context '#add_dish' do
    it 'adds dishes to dishes array' do
      potluck = Potluck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

      expect(potluck.dishes).to eq([])

      potluck.add_dish(couscous_salad)
      potluck.add_dish(cocktail_meatballs)

      expect(potluck.dishes).to eq([couscous_salad, cocktail_meatballs])
    end

    it 'makes dish array gets longer' do
      potluck = Potluck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

      expect(potluck.dishes.length).to eq(0)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(cocktail_meatballs)

      expect(potluck.dishes.length).to eq(2)
    end
  end

  context '#get_all_from_category' do
    it 'gets an array of everything in a category' do
      potluck = Potluck.new("7-13-18")

      couscous_salad     = Dish.new("Couscous Salad", :appetizer)
      summer_pizza       = Dish.new("Summer Pizza", :appetizer)
      roast_pork         = Dish.new("Roast Pork", :entre)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      candy_salad        = Dish.new("Candy Salad", :dessert)

      appetizers = potluck.get_all_from_category(:appetizer)

      expect(appetizers).to eq([])

      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)

      appetizers = potluck.get_all_from_category(:appetizer)

      expect(appetizers).to eq([couscous_salad, summer_pizza])
    end
  end

  context '#menu' do
    it 'returns a menu hash' do
      potluck = Potluck.new("7-13-18")

      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      summer_pizza = Dish.new("Summer Pizza", :appetizer)
      roast_pork = Dish.new("Roast Pork", :entre)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      candy_salad = Dish.new("Candy Salad", :dessert)
      bean_dip = Dish.new("Bean Dip", :appetizer)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)
      potluck.add_dish(bean_dip)

      menu = potluck.menu

      expect(menu).to eq({:appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"],:entres=>["Cocktail Meatballs", "Roast Pork"],:desserts=>["Candy Salad"]})
    end
  end

  context '#ratio' do
    xit '' do

    end
  end
end
