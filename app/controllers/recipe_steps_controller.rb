class RecipeStepsController < ApplicationController
  before_action :get_recipe
  #before_action :set_recipe_step, only: %i[ show edit update destroy ]
  before_action :set_recipe_step, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #Only allow editing, updating and destroying of states associated with the current user
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /recipe_steps or /recipe_steps.json
  def index
    #See note under index for recipe_ingredients - this change fundamentally changes how admins interact with recipe steps. It might not be a big deal
    @recipe_steps = @recipe.recipe_steps.order(step_number: :asc)
  end

  # GET /recipe_steps/1 or /recipe_steps/1.json
  def show
  end

  # GET /recipe_steps/new
  def new
    @recipe_step = @recipe.recipe_steps.build
  end

  # GET /recipe_steps/1/edit
  def edit
  end

  # POST /recipe_steps or /recipe_steps.json
  def create
    @recipe_step = @recipe.recipe_steps.build(recipe_step_params)

    respond_to do |format|
      if @recipe_step.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.append("recipe-steps-container", partial: "recipe_steps/recipe_step", locals: {recipe: @recipe, recipe_step: @recipe_step})
        end
        format.html { redirect_to recipe_path(@recipe), notice: "Recipe step was successfully created." }
        format.json { render :show, status: :created, location: @recipe_step }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_steps/1 or /recipe_steps/1.json
  def update
    respond_to do |format|
      if @recipe_step.update(recipe_step_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@recipe_step, partial: "recipe_steps/recipe_step", locals: {recipe: @recipe, recipe_step: @recipe_step})
        end
        format.html { redirect_to recipe_path(@recipe), notice: "Recipe step was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe_step }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_steps/1 or /recipe_steps/1.json
  def destroy
    @recipe_step.destroy

    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe), notice: "Recipe step was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def correct_user
      @recipe_step = current_user.recipe_steps.find_by(id: params[:id])
      redirect_to recipe_steps_path, notice: "Not authorized!" if @recipe_step.nil?
    end
    def get_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_step
      @recipe_step = RecipeStep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_step_params
      params.require(:recipe_step).permit(:recipe_id, :step_number, :step_text, :user_id)
    end
end
