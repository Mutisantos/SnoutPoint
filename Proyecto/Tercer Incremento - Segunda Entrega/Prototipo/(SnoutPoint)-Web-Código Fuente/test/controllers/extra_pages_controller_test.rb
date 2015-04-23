require 'test_helper'

class ExtraPagesControllerTest < ActionController::TestCase
  test "should get Terminos" do
    get :Terminos
    assert_response :success
  end

end
