module UsersHelper
  def current_user_is_following(current_id, following_id)
    follow = Follow.find_by(follower_id: current_id, following_id: following_id)
    return true if follow
  end
end
