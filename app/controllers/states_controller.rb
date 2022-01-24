class StatesController < ApplicationController
  #before_action :set_state, only: %i[ show edit update destroy 
  before_action :set_state, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #Only allow editing, updating and destroying of states associated with the current user
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /states or /states.json
  def index
    if current_user.admin
      @states = State.all
    else
      @states = current_user.states.or(State.where(global: "T"))
    end
  end

  # GET /states/1 or /states/1.json
  def show
  end

  # GET /states/new
  def new
    #@state = State.new
    @state = current_user.states.build
    
  end

  # GET /states/1/edit
  def edit
  end

  # POST /states or /states.json
  def create
    #@state = State.new(state_params)
    @state  = current_user.states.build(state_params)

    respond_to do |format|
      if @state.save
        format.html { redirect_to state_url(@state), notice: "State was successfully created." }
        format.json { render :show, status: :created, location: @state }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /states/1 or /states/1.json
  def update
    respond_to do |format|
      if @state.update(state_params)
        format.html { redirect_to state_url(@state), notice: "State was successfully updated." }
        format.json { render :show, status: :ok, location: @state }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /states/1 or /states/1.json
  def destroy
    @state.destroy

    respond_to do |format|
      format.html { redirect_to states_url, notice: "State was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #-----------------custom stuff
  def correct_user
    @state = current_user.states.find_by(id: params[:id])
    redirect_to states_path, notice: "Not authorized!" if @state.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def state_params
      params.require(:state).permit(:name, :user_id, :global)
    end
end
