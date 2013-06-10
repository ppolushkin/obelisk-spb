# coding: utf-8

require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

  include ProductsHelper  

  setup do
    @product = products(:venok1)

    @new_product  = {
        :article         => 'В77777',
        :name            => 'Новый Венок',
        :height          => '150',
        :width           => '150',
        :notes           => 'Замечательный новый веночек',
        :small_image_name=> TestUploadedFile.new,
        :big_image_name  => TestUploadedFile.new,
        :extra_image_name=> TestUploadedFile.new,
        :price           => '300'
    }

    @new_product_with_existing_article  = {
        :article         => 'В332',
        :name            => 'Новый Венок',
        :height          => '150',
        :width           => '150',
        :notes           => 'Замечательный новый веночек',
        :small_image_name=> TestUploadedFile.new,
        :big_image_name  => TestUploadedFile.new,
        :extra_image_name=> TestUploadedFile.new,
        :price           => '300'
    }

    @product_update = {
        :article         => 'В332',
        :name            => 'Новый Венок',
        :height          => '150',
        :width           => '150',
        :notes           => 'Замечательный новый веночек',
        :price           => '300'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product and upload images then remove it with images" do
    assert_difference('Product.count') do
      post :create, :product => @new_product
    end

    assert_redirected_to product_path(assigns(:product))
    assert_equal true, File.exist?(Dir.pwd + '/public' + '/images/foto/V77777-s.jpg')
    assert_equal true, File.exist?(Dir.pwd + '/public' + '/images/foto/V77777-b.jpg')
    assert_equal true, File.exist?(Dir.pwd + '/public' + '/images/foto/V77777-e.jpg')

    product_for_remove = Product.find_all_by_article(@new_product[:article])[0]

    assert_difference('Product.count', -1) do
      delete :destroy, :id => product_for_remove.to_param
    end

    assert_redirected_to products_path
    assert_equal false, File.exist?(Dir.pwd + '/public' + '/images/foto/V77777-s.jpg')
    assert_equal false, File.exist?(Dir.pwd + '/public' + '/images/foto/V77777-b.jpg')
    assert_equal false, File.exist?(Dir.pwd + '/public' + '/images/foto/V77777-e.jpg')
  end

  test "should not create product with existing article" do
    assert_difference('Product.count', 0) do
      post :create, :product => @new_product_with_existing_article
    end
  end

  test "should show product" do
    get :show, :id => @product.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @product.to_param
    assert_response :success
  end

  test "should update product" do
    put :update, :id => @product.to_param, :product => @product_update
    assert_redirected_to product_path(assigns(:product))
  end

  class TestUploadedFile
    def read
      "sample test data"
    end
  end

end
