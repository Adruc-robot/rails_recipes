class RecipeIngredientsController < ApplicationController
  #before_action :set_recipe_ingredient, only: %i[ show edit update destroy ]
  before_action :set_recipe_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #Only allow editing, updating and destroying of states associated with the current user
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /recipe_ingredients or /recipe_ingredients.json
  def index
    if current_user.admin
      @recipe_ingredients = RecipeIngredient.all.order(recipe_id: :asc, ingredient_id: :asc)
    else
      @recipe_ingredients = current_user.recipe_ingredients.or(RecipeIngredient.where(global: "T")).order(recipe_id: :asc, ingredient_id: :asc)
    end
  end

  # GET /recipe_ingredients/1 or /recipe_ingredients/1.json
  def show
  end

  # GET /recipe_ingredients/new
  def new
    #@recipe_ingredient = RecipeIngredient.new
    @recipe_ingredient = current_user.recipe_ingredients.build
    @recipes = current_user.recipes.select(:name, :id).order(name: :asc)
    @ingredients = current_user.ingredients.or(Ingredient.where(global: "T")).select(:name, :id).order(name: :asc)
    @units = current_user.units.or(Unit.where(global: "T")).select(:name, :id).order(name: :asc)
  end

  # GET /recipe_ingredients/1/edit
  def edit
    @recipes = current_user.recipes.select(:name, :id).order(name: :asc)
    @ingredients = current_user.ingredients.or(Ingredient.where(global: "T")).select(:name, :id).order(name: :asc)
    @units = current_user.units.or(Unit.where(global: "T")).select(:name, :id).order(name: :asc)
  end

  # POST /recipe_ingredients or /recipe_ingredients.json
  def create
    #@recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
    @recipe_ingredient = current_user.recipe_ingredients.build(recipe_ingredient_params)

    respond_to do |format|
      if @recipe_ingredient.save
        format.html { redirect_to recipe_ingredient_url(@recipe_ingredient), notice: "Recipe ingredient was successfully created." }
        format.json { render :show, status: :created, location: @recipe_ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_ingredients/1 or /recipe_ingredients/1.json
  def update
    respond_to do |format|
      if @recipe_ingredient.update(recipe_ingredient_params)
        format.html { redirect_to recipe_ingredient_url(@recipe_ingredient), notice: "Recipe ingredient was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe_ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_ingredients/1 or /recipe_ingredients/1.json
  def destroy
    @recipe_ingredient.destroy

    respond_to do |format|
      format.html { redirect_to recipe_ingredients_url, notice: "Recipe ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def correct_user
    @recipe_ingredient = current_user.recipe_ingredients.find_by(id: params[:id])
    redirect_to recipes_path, notice: "Not authorized!" if @recipe_ingredient.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_ingredient
      @recipe_ingredient = RecipeIngredient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_ingredient_params
      params.require(:recipe_ingredient).permit(:recipe_id, :ingredient_id, :amount, :unit_id, :prep_instructions, :user_id)
    end
end
