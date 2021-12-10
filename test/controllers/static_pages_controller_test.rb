require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get whatisgaffex" do
    get static_pages_whatisgaffex_url
    assert_response :success
  end

  test "should get aboutus" do
    get static_pages_aboutus_url
    assert_response :success
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
  end

end
