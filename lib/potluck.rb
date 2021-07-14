class Potluck
  attr_reader :date,
              :dishes

  def initialize(date)
    @date   = date
    @dishes = []
  end

  def add_dish(name)
    @dishes.push(name)
  end

  # test this
  def grouped_dishes
    grouped_dishes = @dishes.group_by { |dish| dish.category }
  end

  def categories
    grouped_dishes.keys
  end

  def get_all_from_category(category)
    grouped_dishes == {} ? [] : grouped_dishes[category]
  end

  def menu
    hash = {}
    categories.each do |category|
      hash[plural(category)] = grouped_dishes_array(category)
    end
    hash
  end

  def grouped_dishes_array(category)
    grouped_dishes[category].map { |dish| dish.name }.sort
  end

  def plural(symbol)
    symbol = (symbol.to_s + "s").to_sym
  end

  def ratio(category)
    (grouped_dishes_array(category).length.to_f / total_dishes) * 100
  end

  def total_dishes
    @dishes.length
  end
end
