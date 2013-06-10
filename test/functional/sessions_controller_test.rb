require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should display login form" do
    get :show_login_form
    assert_response :success
  end

  test "should log in" do
    post :log_in, :name => 'admin', :password => 'mario2'
    assert_redirected_to about_us_url    
  end

  test "should not log in" do
    post :log_in, :name => '', :password => ''
    assert_redirected_to login_url
  end

end
