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

  def get_all_from_category(category)
    grouped_dishes[category]
  end
end
