require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "knows if he's the 'nobody' user or not" do
    user = User.find(2)
    assert user.is_nobody?
  end
end
