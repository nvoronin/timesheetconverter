require 'test_helper'

class ConvertersControllerTest < ActionController::TestCase
  test "should get weekly" do
    get :weekly
    assert_response :success
  end

  test "should get daily" do
    get :daily
    assert_response :success
  end

end
