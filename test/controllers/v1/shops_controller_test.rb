require 'test_helper'

class V1::ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get v1_shops_index_url
    assert_response :success
  end

end
