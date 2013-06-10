# coding: utf-8

require 'test_helper'

class PageTest < ActiveSupport::TestCase

  test "page attributes must not be empty" do
    page = Page.new
    assert page.invalid?

    [:reference, :title].each do |property|
      assert page.errors[property].any?
    end
  end

  test "page with non unique reference cannot be saved" do
    page = Page.new(:reference => "page1", :title=>"page1")
    assert_equal false, page.errors[:article].any?
    assert_equal false, page.errors[:title].any?
    assert page.save

    page = Page.new(:reference => "page1", :title=>"page1")
    assert !page.save
  end

end
