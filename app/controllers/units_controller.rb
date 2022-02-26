class UnitsController < ApplicationController
  before_action :set_unit, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  #Only allow editing, updating and destroying of units associated with the current user
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /units or /units.json
  def index
    @units = Unit.where("user_id=? or global=?",current_user.id,"T").order(name: :asc)
  end

  # GET /units/1 or /units/1.json
  def show
  end

  # GET /units/new
  def new
    @unit = Unit.new
  end

  # GET /units/1/edit
  def edit
  end

  # POST /units or /units.json
  def create
    @unit = Unit.new(unit_params)

    respond_to do |format|
      if @unit.save
        format.html { redirect_to unit_url(@unit), notice: "Unit was successfully created." }
        format.json { render :show, status: :created, location: @unit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /units/1 or /units/1.json
  def update
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to unit_url(@unit), notice: "Unit was successfully updated." }
        format.json { render :show, status: :ok, location: @unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1 or /units/1.json
  def destroy
    @unit.destroy

    respond_to do |format|
      format.html { redirect_to units_url, notice: "Unit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @unit = current_user.units.find_by(id: params[:id])
    redirect_to units_path, notice: "Not authorized!" if @unit.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def unit_params
      params.require(:unit).permit(:name, :user_id, :global)
    end
end
