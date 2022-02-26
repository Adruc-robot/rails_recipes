class RecipesController < ApplicationController
  #before_action :set_recipe, only: %i[ show edit update destroy ]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #Only allow editing, updating and destroying of states associated with the current user
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /recipes or /recipes.json
  def index
    if current_user.admin == "T"
      #at some point, admin won't want to see all the recipes (hopefully)
      @recipes = Recipe.all.order(name: :asc)
    else
      @recipes = Recipe.where("user_id=? or global=?",current_user.id,"T").order(name: :asc)
    end
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe_ingredients = @recipe.recipe_ingredients.includes(:ingredient).order("ingredients.name ASC")
    @recipe_steps = @recipe.recipe_steps.order("recipe_steps.step_number")
  end

  # GET /recipes/new
  def new
    @recipe = current_user.recipes.build
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.prepend("recipes", partial: "recipes/recipe", locals: {recipe: @recipe})
        end

        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully created." }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("recipeTitle", partial: "recipes/recipeTitle", locals: {recipe: @recipe})
        end
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      #format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.html { redirect_to recipes_path, status: :see_other, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  #-----------------custom stuff
  def correct_user
    @recipe = current_user.recipes.find_by(id: params[:id])
    redirect_to recipes_path, notice: "Not authorized!" if @recipe.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find_by_id(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:name, :user_id, :global, :status)
    end
end
