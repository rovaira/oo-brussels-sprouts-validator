class Ingredient

  def initialize(quantity, unit, name)
    @quantity = quantity
    @unit = unit
    @name = name
  end

  def summary
    "#{@quantity} #{@unit} #{@name}"
  end

  def valid
    valid_ingredients = [
      "brussels sprouts",
      "spinach",
      "eggs",
      "milk",
      "tofu",
      "seitan",
      "bell peppers",
      "quinoa",
      "kale",
      "chocolate",
      "beer",
      "wine",
      "whiskey"
    ]
    valid_ingredients.include?(@name.downcase)
  end

  def self.parse(iso8601_string)
    tokens = iso8601_string.split(" ", 3)
    quantity = token[0].to_i
    unit = token[1]
    name = token[2]

    Ingredient.new(quantity, unit, name)
  end

end

ingredient = Ingredient.new(47.0, "lb(s)", "Brussels Sprouts")
puts ingredient.summary

class Recipe

  def initialize(name, ingredients, instructions)
    @name = name
    @ingredients = ingredients
    @instructions = instructions
  end

  def print_ingredients
    print_ingredients = ""
    @ingredients.each do |item|
      print_ingredients << "-" << item.summary << "\n"
    end
    print_ingredients
  end

  def print_instructions
    print_instructions = ""
    count = 0
    @instructions.each {|item| print_instructions << "#{count += 1}. " << item << "\n"}
    print_instructions
  end

  def allergy_free_dish

    @ingredients.each do |item|
      return false if !item.valid
    end
    true
  end

  def summary_test
    %{
Name: #{@name}
Okay to eat? #{allergy_free_dish}
Ingredients
#{print_ingredients}
Instructions
#{print_instructions}}
  end

end

ingredients = [
  Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
  Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
  Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
  Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
]

instructions = [
    "Preheat oven to 400 degrees F.",
    "Cut off the brown ends of the Brussels sprouts.",
    "Pull off any yellow outer leaves.",
    "Mix them in a bowl with the olive oil, salt and pepper.",
    "Pour them on a sheet pan and roast for 35 to 40 minutes.",
    "They should be until crisp on the outside and tender on the inside.",
    "Shake the pan from time to time to brown the sprouts evenly.",
    "Sprinkle with more kosher salt ( I like these salty like French fries).",
    "Serve and enjoy!"
    ]

ingredients_steak = [
  Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper"),
  Ingredient.new(1, "lb(s)", "Beef nice cut")
]

instructions_steak = [
  "Preheat oven to 400 degrees F.",
  "EAT STEAK!"
]

ingredients_allergy_free = [
  Ingredient.new(0.5, "tspn(s)", "spinach"),
  Ingredient.new(1, "lb(s)", "eggs")
]

instructions_allergy_free = [
  "Pretend to enjoy!"
]

recipes = [
  Recipe.new("Roasted Brussels Sprouts", ingredients, instructions),
  Recipe.new("Steak", ingredients_steak, instructions_steak),
  Recipe.new("Fake Food", ingredients_allergy_free, instructions_allergy_free)
  ]

puts "RECIPES"

recipes.each do |recipe|
  puts recipe.summary_test
end
