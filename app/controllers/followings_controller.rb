class FollowingsController < ApplicationController
  before_action :set_following, only: [:destroy]

  # GET /users/new
  def new
    @following = Following.new
  end

  # POST /users
  # POST /users.json
  def create
    @following = Following.new(following_params)

    respond_to do |format|
      if @following.save
        user = @following.user
        format.html { redirect_to user, notice: 'User was successfully followed.' }
        format.json { render :show, status: :created, location: user }
      else
        format.html { render :new }
        format.json { render json: @following.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    user = @following.user
    @following.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Following was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_following
      @following = Following.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:following).permit(:user, :follower)
    end
end
