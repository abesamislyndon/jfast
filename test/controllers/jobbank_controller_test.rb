require 'test_helper'

class JobbankControllerTest < ActionController::TestCase
  test "should get joblist" do
    get :joblist
    assert_response :success
  end

end
