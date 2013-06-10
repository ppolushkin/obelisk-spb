# coding: utf-8

require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    @page     = pages(:page_one)
    @revision = revisions(:revision_one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page" do
    assert_difference ['Page.count', 'Revision.count'], +1 do
      post :create, :page => {:reference => 'new_reference', :title=>'new_title'}, :revision=>{:content=>'new_content'}
    end

    assert_redirected_to page_path(assigns(:page))
  end

  test "should show page" do
    get :show, :id => @page.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @page.to_param
    assert_response :success
  end

  test "should update page" do
    assert_difference('Revision.count') do
      put :update, :id => @page.to_param, :page => @page.attributes, :revision => {:content=>'new_content'}
    end

    assert_redirected_to page_path(assigns(:page))
  end

  test "should destroy page" do
    assert_difference ['Page.count', 'Revision.count'], -1 do
      delete :destroy, :id => @page.to_param
    end

    assert_redirected_to pages_path
  end

  test "show page by reference" do
    get :show_by_page_ref, :page_ref => @page.reference
    assert_response :success
  end

  test "show page by reference that does not exist" do
    get :show_by_page_ref, :page_ref => "reference_that_does_not_exist"
    assert_redirected_to :action => "new", :page_ref => "reference_that_does_not_exist"
  end

end
