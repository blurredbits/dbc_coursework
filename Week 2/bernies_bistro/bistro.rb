require 'csv'

class Recipe

  attr_accessor :id
  attr_reader :name

 def initialize(recipe)
    @id = recipe[:id]
    @name = recipe[:name]
    @description = recipe[:description]
    @ingredients = recipe[:ingredients]
    @directions = recipe[:directions]
 end

 def to_s
   output_string = ""
   output_string << "#{id}"
   output_string << " - "
   output_string << name + "\n"
   output_string << @description + "\n"*2
   output_string << "Ingredients: \n"
   output_string << @ingredients + "\n"*2
   output_string << "Preparation Instructions \n"
   output_string << @directions
   output_string << "\n" * 2

   output_string
 end

end

class Bistro

  attr_accessor :recipes

  def initialize
    @recipes = []
  end

  def load_recipes(filename)
    recipes_csv = CSV.table(filename, :headers => true )
    recipes_csv.each do |recipe|
        @recipes << Recipe.new(recipe)
    end
  end

  def find_recipe_by_id(recipe_id)
    if recipe_id < 1
      raise "Please enter a positive number"
    end

    recipe_id -= 1
    if !@recipes[recipe_id].nil?
      puts @recipes[recipe_id]
    else
      raise "Can't find a recipe with an id of #{recipe_id.inspect}"
    end
  end

  def sort_recipes
    @recipes.sort! { |a,b| a.name <=> b.name }
  end

  def reassign_id
    sort_recipes
    @recipes.each_with_index do |item, index|
      item.id = index + 1
    end
  end

  def list_recipes
    @recipes.each do |recipe|
      puts "#{recipe.id}. #{recipe.name} "
    end
  end

end
