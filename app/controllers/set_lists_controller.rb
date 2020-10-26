class SetListsController < ApplicationController
  before_action :get_user
  before_action :set_set_list, only: [:show, :edit, :update, :destroy]

  # GET /set_lists
  # GET /set_lists.json
  def index
    @set_lists = @user.set_lists
  end

  # GET /set_lists/1
  # GET /set_lists/1.json
  def show
  end

  # GET /set_lists/new
  def new
    @set_list = @user.set_lists.build
  end

  # GET /set_lists/1/edit
  def edit
  end

  # POST /set_lists
  # POST /set_lists.json
  def create
    @set_list = @user.set_lists.build

    respond_to do |format|
      if @set_list.save
        format.html { redirect_to user_set_lists_path(@user), notice: 'Set list was successfully created.' }
        format.json { render :show, status: :created, location: @set_list }
      else
        format.html { render :new }
        format.json { render json: @set_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /set_lists/1
  # PATCH/PUT /set_lists/1.json
  def update
    respond_to do |format|
      if @set_list.update(set_list_params)
        format.html { redirect_to user_set_lists_path(@user), notice: 'Set list was successfully updated.' }
        format.json { render :show, status: :ok, location: @set_list }
      else
        format.html { render :edit }
        format.json { render json: @set_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /set_lists/1
  # DELETE /set_lists/1.json
  def destroy
    @set_list.destroy
    respond_to do |format|
      format.html { redirect_to user_set_lists_path(@user), notice: 'Set list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def get_user
      @user = User.find(params[:user_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_set_list
      @set_list = SetList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def set_list_params
      params.require(:set_list).permit(:title, :user_id)
    end
end
