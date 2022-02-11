require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'users can be disabled' do
    freeze_time do
      user = User.new

      # disable function adds current timestamp to disabled_at column
      # which has been nil before and becomes true
      user.disable

      assert_equal Time.current, user.disabled_at
      assert_equal true, user.disabled?
    end
  end
end
