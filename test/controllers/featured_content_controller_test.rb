require "test_helper"

class FeaturedContentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get featured_content_index_url
    assert_response :success
  end

  test "should get show" do
    get featured_content_show_url
    assert_response :success
  end
end
