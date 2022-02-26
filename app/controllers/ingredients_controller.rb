class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  #Only allow editing, updating and destroying of ingredients associated with the current user
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /ingredients or /ingredients.json
  def index
    @ingredients = Ingredient.where("user_id=? or global=?",current_user.id,"T").order(name: :asc)
  end

  # GET /ingredients/1 or /ingredients/1.json
  def show
  end

  # GET /ingredients/new
  def new
    @states = State.where("user_id=? or global=?",current_user.id,"T").order(name: :asc)
    @locations = Location.where("user_id=? or global=?",current_user.id,"T").order(name: :asc)
    @ingredient = current_user.ingredients.build
  end

  # GET /ingredients/1/edit
  def edit
    @states = State.where("user_id=? or global=?",current_user.id,"T").order(name: :asc)
    @locations = Location.where("user_id=? or global=?",current_user.id,"T").order(name: :asc)
  end

  # POST /ingredients or /ingredients.json
  def create
    @ingredient = current_user.ingredients.build(ingredient_params)
    
    respond_to do |format|
      if @ingredient.save
        format.turbo_stream 
        #I'm unsure where to redirect at this point, so I'll test with just this the format.turbo_stream above.
        #do
          #render turbo_stream: turbo_stream.append("recipe-ingredients-container", partial: #"recipe_ingredients/recipe_ingredient", locals: {recipe: @recipe, recipe_ingredient: #@recipe_ingredient})
        #end
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
        #again, unsure if I want to redirect, so just format.turbo_stream
        format.turbo_stream
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
      format.html { redirect_to ingredients_path, notice: "Ingredient was successfully destroyed." }
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
