require 'test_helper'

class V1::GirlsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get v1_girls_index_url
    assert_response :success
  end

end
