class RecipeIngredientsController < ApplicationController
  #before_action :set_recipe_ingredient, only: %i[ show edit update destroy ]
  before_action :get_recipe
  before_action :set_recipe_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #Only allow editing, updating and destroying of states associated with the current user
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /recipe_ingredients or /recipe_ingredients.json
  def index
    #I believe this view is no longerused, but here goes.
    @recipe_ingredients = @recipe.recipe_ingredients.includes(:ingredient).order("recipe.name ASC, ingredients.name ASC")
  end

  # GET /recipe_ingredients/1 or /recipe_ingredients/1.json
  def show
  end

  # GET /recipe_ingredients/new
  def new
    @ingredients = Ingredient.where("user_id=? or global=?",current_user.id,"T").order(name: :asc)
    @units = Unit.where("user_id=? or global=?",current_user.id,"T").order(name: :asc)
    @recipe_ingredient = @recipe.recipe_ingredients.build
  end

  # GET /recipe_ingredients/1/edit
  def edit
    @ingredients = Ingredient.where("user_id=? or global=?",current_user.id,"T").order(name: :asc)
    @units = Unit.where("user_id=? or global=?",current_user.id,"T").order(name: :asc)
  end

  # POST /recipe_ingredients or /recipe_ingredients.json
  def create
    @recipe_ingredient = @recipe.recipe_ingredients.build(recipe_ingredient_params)

    respond_to do |format|
      if @recipe_ingredient.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.append("recipe-ingredients-container", partial: "recipe_ingredients/recipe_ingredient", locals: {recipe: @recipe, recipe_ingredient: @recipe_ingredient})
        end
        #since this is being triggered off of the recipe, redirect back
        format.html { redirect_to recipe_path(@recipe), notice: "Recipe ingredient was successfully created." }
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
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@recipe_ingredient, partial: "recipe_ingredients/recipe_ingredient", locals: {recipe: @recipe, recipe_ingredient: @recipe_ingredient})
        end
        #same as above - redirect to recipe
        format.html { redirect_to recipe_path(@recipe), notice: "Recipe ingredient was successfully updated." }
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
      #same on the redirect
      format.html { redirect_to recipe_recipe_ingredients_path(@recipe), notice: "Recipe ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  

  private
    def correct_user
      #might need to reconsider this as it might not be necessary. recipe_ingredients psuedo-inherit ownership based on the recipe.user_id - having it on recipe_ingredients is kind of redundant
      @recipe_ingredient = current_user.recipe_ingredients.find_by(id: params[:id])
      redirect_to recipes_path, notice: "Not authorized!" if @recipe_ingredient.nil?
    end
    def get_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_ingredient
      @recipe_ingredient = RecipeIngredient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_ingredient_params
      params.require(:recipe_ingredient).permit(:recipe_id, :ingredient_id, :amount, :unit_id, :prep_instructions, :user_id)
    end
end
