require 'test_helper'

class TerrainTest < ActiveSupport::TestCase
  test "can create terrain with name" do
    terrain = Terrain.new(name: "Le Five Aubervilliers")
    terrain.valid?
    assert terrain.errors[:name].empty?
  end

  test "cannot create terrain without a name" do
    terrain = Terrain.new(name: "")
    terrain.valid?
    assert_not(terrain.errors[:name].empty?, "Terrain was created without providing a name")
  end

  test "cannot create terrain with a name shorter than 4 characters" do
    terrain = Terrain.new(name: "boo")
    terrain.valid?
    assert_not(terrain.errors[:name].empty?, "Terrain was created with a name shorter than 4 character")
  end

  test "can create terrain with valid price" do
    terrain = Terrain.new(price_cents: 120)
    terrain.valid?
    assert terrain.errors[:price_cents].empty?
  end

  test "cannot create terrain without price" do
    terrain = Terrain.new
    terrain.valid?
    assert_not(terrain.errors[:price_cents].empty?, "Terrain was created without providing a price")
  end

  test "cannot create terrain with a negative price" do
    terrain = Terrain.new(price_cents: -1)
    terrain.valid?
    assert_not(terrain.errors[:price_cents].empty?, "Terrain was created with a negative integer as price")
  end

  test "cannot create terrain with a decimal as price" do
    terrain = Terrain.new(price_cents: 100.12)
    terrain.valid?
    assert_not(terrain.errors[:price_cents].empty?, "Terrain was created with a decimal as price in cents")
  end

  test "can terrain with an associated user" do
    terrain = Terrain.new(user_id: users(:john))
    terrain.valid?
    assert(terrain.errors[:user_id].empty?)
  end

  test "cannot terrain without an associated user" do
    terrain = Terrain.new
    terrain.valid?
    assert_not(terrain.errors[:user].empty?, "Should not be able to create a terrain without a user")
  end
end
