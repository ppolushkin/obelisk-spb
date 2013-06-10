require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get show_venki" do
    get :show_venki
    assert_response :success
    assert_select '.product-block', 4
  end

  test "should get show_korsinu" do
    get :show_korsinu
    assert_response :success
    assert_select '.product-block', 1
  end

end
