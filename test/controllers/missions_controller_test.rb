require 'test_helper'

class MissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get missions_index_url
    assert_response :success
  end

end
