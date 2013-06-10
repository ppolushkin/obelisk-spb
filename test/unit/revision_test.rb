require 'test_helper'

class RevisionTest < ActiveSupport::TestCase

  test "revision attributes can be empty" do
    revision = Revision.new
    assert revision.valid?
  end


end
