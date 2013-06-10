# coding: utf-8

require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?

    [:article, :name, :price].each do |property|
      assert product.errors[property].any?
    end
  end

  test "product article validation" do
    product = Product.new
#   Check correct articles
    ['В0', 'В0123456789', 'К0', 'К0123456789', 'Ф0', 'Ф0123456789'].each do |correct_article|
      product.article=correct_article
      assert product.invalid?
      assert_equal false, product.errors[:article].any?, "Validation check error! #{correct_article} article for the new product should be correct!"
    end
#   Check wrong articles
    ['', '12В01','В01В','В01sd', 'V0', 'В', '0', 'Фv', 'в0123456789', 'к0', 'к0123456789', 'ф0', 'ф0123456789'].each do |wrong_article|
      product.article=wrong_article
      assert product.invalid?
      assert product.errors[:article].any?, "Validation check error! #{wrong_article} article for the new product should be wrong!"
    end
  end

  test "product :height, :width and :price must be a positive number" do
    product       = Product.new
# Calling these methods in order to avoid NameError. TODO: need to understand the mechanism of this ;)
    product.height=product.width=product.price=""

    {:height=>:height=, :width=>:width=, :price=>:price=}.each do |property, property_setter|
#   Check correct values
      ['30.5', '1', '0123456789'].each do |correct_value|
        product.method(property_setter).call(correct_value)
        assert product.invalid?
        assert_equal false, product.errors[property].any?, "Validation check error! #{correct_value} "+property.to_s+" for the new product should be correct!"
      end
# Check wrong values
      ['1c', 'c0123456789', 'f', '-1'].each do |wrong_value|
        product.method(property_setter).call(wrong_value)
        assert product.invalid?
        assert product.errors[property].any?, "Validation check error! #{wrong_value} "+property.to_s+" for the new product should be wrong!"
      end
    end
  end

end

