class RecipeStepsController < ApplicationController
  #before_action :set_recipe_step, only: %i[ show edit update destroy ]
  before_action :set_recipe_step, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #Only allow editing, updating and destroying of states associated with the current user
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /recipe_steps or /recipe_steps.json
  def index
    if current_user.admin
      @recipe_steps = RecipeStep.all.order(recipe_id: :asc, step_number: :asc)
    else
      @recipes_steps = current_user.recipe_steps.or(RecipeStep.where(global: "T")).order(recipe_id: :asc, step_number: :asc)
    end
  end

  # GET /recipe_steps/1 or /recipe_steps/1.json
  def show
  end

  # GET /recipe_steps/new
  def new
    #@recipe_step = RecipeStep.new
    @recipe_step = current_user.recipe_steps.build
  end

  # GET /recipe_steps/1/edit
  def edit
  end

  # POST /recipe_steps or /recipe_steps.json
  def create
    #@recipe_step = RecipeStep.new(recipe_step_params)
    @recipe_step = current_user.recipe_steps.build(recipe_step_params)

    respond_to do |format|
      if @recipe_step.save
        format.html { redirect_to recipe_step_url(@recipe_step), notice: "Recipe step was successfully created." }
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
        format.html { redirect_to recipe_step_url(@recipe_step), notice: "Recipe step was successfully updated." }
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
      format.html { redirect_to recipe_steps_url, notice: "Recipe step was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #-----------------custom stuff
  def correct_user
    @recipe_step = current_user.recipe_steps.find_by(id: params[:id])
    redirect_to recipe_steps_path, notice: "Not authorized!" if @recipe_step.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_step
      @recipe_step = RecipeStep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_step_params
      params.require(:recipe_step).permit(:recipe_id, :step_number, :step_text, :user_id, :global)
    end
end
