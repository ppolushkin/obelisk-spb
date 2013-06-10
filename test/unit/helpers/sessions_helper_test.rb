require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  test "success authentication" do
    assert_equal true, authenticate_user("admin", "mario2")
  end

  test "failed authentication" do
    assert_equal false, authenticate_user("", "")
  end

end
