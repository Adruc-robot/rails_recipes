class MealPrepsController < ApplicationController
  before_action :set_meal_prep, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /meal_preps or /meal_preps.json
  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    #used for the calendar
    @meal_preps = current_user.meal_preps.where(start_time: start_date.beginning_of_week...start_date.end_of_week).includes(:recipe)
    #used to get the total ingredients
    @testValue = current_user.meal_preps.where(start_time: start_date.beginning_of_week...start_date.end_of_week).joins(recipe: [ recipe_ingredients: [ :ingredient, :unit ] ] ).group("ingredients.name, units.name").select("sum(recipe_ingredients.amount) as tAmount, units.name as unit, ingredients.name as ingredient")
  end

  # GET /meal_preps/1 or /meal_preps/1.json
  def show
  end

  # GET /meal_preps/new
  def new
    #@meal_prep = MealPrep.new
    @meal_prep = current_user.meal_preps.build
    @recipes = Recipe.where("user_id=? or global=?", current_user.id, "T").order(name: :asc)
  end

  # GET /meal_preps/1/edit
  def edit
    @recipes = Recipe.where("user_id=? or global=?", current_user.id, "T").order(name: :asc)
  end

  # POST /meal_preps or /meal_preps.json
  def create
    #@meal_prep = MealPrep.new(meal_prep_params)
    #@meal_prep = current_user.meal_preps.build(meal_prep_params)
    @meal_prep = current_user.meal_preps.build(meal_prep_params)

    respond_to do |format|
      if @meal_prep.save
#need to figure out actions after save of meal_prep

        format.html { redirect_to meal_prep_url(@meal_prep), notice: "Meal prep was successfully created." }
        format.json { render :show, status: :created, location: @meal_prep }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meal_prep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meal_preps/1 or /meal_preps/1.json
  def update
    respond_to do |format|
      if @meal_prep.update(meal_prep_params)
        format.html { redirect_to meal_prep_url(@meal_prep), notice: "Meal prep was successfully updated." }
        format.json { render :show, status: :ok, location: @meal_prep }
      else
        format.html { render :edit, status: :unprocessable_entity }
       format.json { render json: @meal_prep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_preps/1 or /meal_preps/1.json
  def destroy
    @meal_prep.destroy

    respond_to do |format|
      format.html { redirect_to meal_preps_url, notice: "Meal prep was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  #-----------------custom stuff
  def correct_user
    @meal_prep = current_user.meal_preps.find_by(id: params[:id])
    redirect_to meal_prep_path, notice: "Not authorized!" if @meal_prep.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_prep
      @meal_prep = MealPrep.find_by_id(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meal_prep_params
      params.require(:meal_prep).permit(:users_id, :meal_date, :meal_type, :recipe_id, :start_time, :end_time)
    end
end
