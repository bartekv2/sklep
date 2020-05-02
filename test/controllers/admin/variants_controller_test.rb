require 'test_helper'

class Admin::VariantsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_variants_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_variants_edit_url
    assert_response :success
  end

end
