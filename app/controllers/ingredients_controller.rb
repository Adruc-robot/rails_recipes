class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  #Only allow editing, updating and destroying of ingredients associated with the current user
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /ingredients or /ingredients.json
  def index
    #@ingredients = Ingredient.all
    if current_user.admin
      @ingredients = Ingredient.all.order(name: :asc)
    else
      @ingredients = current_user.ingredients.or(Ingredient.where(global: "T")).order(name: :asc)
    end
  end

  # GET /ingredients/1 or /ingredients/1.json
  def show
  end

  # GET /ingredients/new
  def new
    #@ingredient = Ingredient.new
    @ingredient = current_user.ingredients.build
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients or /ingredients.json
  def create
    #@ingredient = Ingredient.new(ingredient_params)
    @ingredient = current_user.ingredients.build(ingredient_params)
    
    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to ingredient_url(@ingredient), notice: "Ingredient was successfully created." }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1 or /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to ingredient_url(@ingredient), notice: "Ingredient was successfully updated." }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1 or /ingredients/1.json
  def destroy
    @ingredient.destroy

    respond_to do |format|
      #format.html { redirect_to ingredients_url, notice: "Ingredient was successfully destroyed." }
      format.html { redirect_to ingredients_path, notice: "Ingredient was successfully destroyed." }
      #format.html { redirect_to ingredients_url, notice: "Ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @ingredient = current_user.ingredients.find_by(id: params[:id])
    redirect_to ingredients_path, notice: "Not authorized!" if @ingredient.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :user_id, :global, :state_id, :location_id)
    end
end
