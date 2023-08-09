require "test_helper"

class MagazinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get magazines_index_url
    assert_response :success
  end
end
