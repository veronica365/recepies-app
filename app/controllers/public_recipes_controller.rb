class PublicRecipesController < ApplicationController
  before_action :set_recipe, only: %i[show]

  # GET /recipes or /recipes.json
  def index
    @public_recipes = Recipe.all.includes(:user).where(public: true)
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    return _private_record_not_found if @recipe.nil?

    @public_recipe_food = RecipeFood.includes(:food).joins(:recipe).where(recipe_id: params[:id],
                                                                          recipes: { public: true })
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.includes(:user).find_by(id: params[:id], public: true)
  end
end
