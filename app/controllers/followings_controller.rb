class FollowingsController < ApplicationController
  before_action :set_following, only: %i[show edit update destroy]

  def create
    @following = Following.new(following_params)

    respond_to do |format|
      if @following.save
        format.html { redirect_to user_path(@following.followed_user), notice: 'Following was successfully created.' }
        format.json { render :show, status: :created, location: @following }
      else
        format.html { render :new }
        format.json { render json: @following.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /followings/1
  # DELETE /followings/1.json
  def destroy
    unfollowed = @following.followed_user
    @following.destroy
    respond_to do |format|
      format.html { redirect_to user_path(unfollowed), notice: 'Following was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_following
    @following = Following.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def following_params
    params.require(:following).permit(:followerid, :followedid)
  end
end
