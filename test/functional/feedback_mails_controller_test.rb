require 'test_helper'

class FeedbackMailsControllerTest < ActionController::TestCase
  setup do
    @feedback_mail = feedback_mails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feedback_mails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedback_mail" do
    assert_difference('FeedbackMail.count') do
      post :create, :feedback_mail => @feedback_mail.attributes
    end

    assert_redirected_to feedback_mail_path(assigns(:feedback_mail))
  end

  test "should show feedback_mail" do
    get :show, :id => @feedback_mail.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @feedback_mail.to_param
    assert_response :success
  end

  test "should update feedback_mail" do
    put :update, :id => @feedback_mail.to_param, :feedback_mail => @feedback_mail.attributes
    assert_redirected_to feedback_mail_path(assigns(:feedback_mail))
  end

  test "should destroy feedback_mail" do
    assert_difference('FeedbackMail.count', -1) do
      delete :destroy, :id => @feedback_mail.to_param
    end

    assert_redirected_to feedback_mails_path
  end
end
