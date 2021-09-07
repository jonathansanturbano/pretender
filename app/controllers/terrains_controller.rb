class TerrainsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @terrains = Terrain.all
  end

  def show
    @terrain = Terrain.find(params[:id])
  end

  def new
    @terrain = Terrain.new
  end
end
