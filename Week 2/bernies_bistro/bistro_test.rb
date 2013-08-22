require_relative('bistro')

# Notes
# 1. Did all of my object testing in IRB with the -r command to load in the bistro_test.rb file
# 2. Ran into a couple stumbling blocks with the sorting recipes in alphabetical order
# 3. Decided to overwrite the id provided in the CSV file with a new ID based on alphabetical order
# 4. Repurposed the to_s method in the recipe class to make printing/formating a bit easier
# 5. Tried to keep the method calls relatively clean, by creating simple nested methods
# 6. Tested with edge cases of negative numbers, and numbers outside of the range (4,7, etc.) in the "display"
# command line argument

# 7. Refactor should include hash table for recipe construction (5 elements is bulky)
# 8. Better handling of the bad argument variables - start by breaking into smaller methods
# 9. Set some of the internal methods to PRIVATE in bistro class to better define the API
#10. Reconsider CSV method for importing - use #table instead?
#11. Get a better understanding from Bernie regarding the use of ID number



# Minimum Viable Product
# 1. Load recipes from a file
# 2. List all recipes, sorted alphabetically by name
# 3. Display a recipes name, description, and ingredients

if ARGV.any?
  bistro = Bistro.new
  bistro.load_recipes("recipes.csv")

  if ARGV[0] == "list"
    bistro.list_recipes
  elsif ARGV[0] == "display"
    puts bistro.find_recipe_by_id(ARGV[1].to_i)
  end
end

# Test Code
# bistro = Bistro.new
# bistro.load_recipes("recipes.csv")
# puts bistro.recipes.length > 0   # => True
# bistro.list_recipes              # => List of Recipes
# bistro.find_recipe_by_id(2)      # => Individual Recipe
