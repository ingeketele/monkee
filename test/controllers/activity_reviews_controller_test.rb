require 'test_helper'

class ActivityReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get activity_reviews_index_url
    assert_response :success
  end

  test "should get create" do
    get activity_reviews_create_url
    assert_response :success
  end

  test "should get update" do
    get activity_reviews_update_url
    assert_response :success
  end

end
