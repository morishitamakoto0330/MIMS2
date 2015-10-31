require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "should get eventer" do
    get :eventer
    assert_response :success
  end

end
