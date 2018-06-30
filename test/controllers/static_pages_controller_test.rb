require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get tweet" do
    get static_pages_tweet_url
    assert_response :success
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

end
