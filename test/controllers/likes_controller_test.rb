require 'test_helper'

class LikesControllerTest < ActionController::TestCase
  test "should get like_post" do
    get :like_post
    assert_response :success
  end

  test "should get unlike_post" do
    get :unlike_post
    assert_response :success
  end

end
