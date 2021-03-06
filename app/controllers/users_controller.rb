class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    redirect_to root_path unless @user == current_user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user == current_user && @user.update(user_params)
        session[:user_id] = @user.id
        format.html { redirect_to edit_user_path(current_user), notice: 'User was successfully updated.' }
        format.json { render :edit, status: :ok, location: edit_user_path(current_user) }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy if @user == current_user
    respond_to do |format|
      format.html { redirect_to events_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_event
    if params[:event_id].present?
      @event = Event.find(params[:event_id])
      @user.events << @event unless @student.events.include?(@event)
    end
    redirect_to events_path
  end

  def delete_event
    @user.attendances.find(params[:event_id]).delete
    redirect_to events_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
