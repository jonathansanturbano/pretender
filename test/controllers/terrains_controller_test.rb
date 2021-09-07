require 'test_helper'

class TerrainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @terrain = terrains(:saintouen)
  end

  test "should get index" do
    get terrains_path
    assert_response :success
    assert_select "div.horizontal-card", 2
  end

  test "should get show" do
    get terrain_path(@terrain)
    assert_response :success
  end

  test "should get new" do
    sign_in(users(:john))
    get new_terrain_url
  end

end
