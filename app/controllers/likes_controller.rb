class LikesController < ApplicationController
  before_action :set_post

  def like_post
    if current_user.like_post @post.id
      respond_to do |format|
        format.html { redirect_to @post }
        format.js
      end
    end
  end

  def unlike_post
    if current_user.unlike_post @post.id
      respond_to do |format|
        format.html { redirect_to @post }
        format.js
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
end
