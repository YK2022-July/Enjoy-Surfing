require "test_helper"

class Admin::TrainingPostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get erase" do
    get admin_training_post_comments_erase_url
    assert_response :success
  end
end
