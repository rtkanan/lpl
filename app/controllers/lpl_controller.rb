class LplController < ApplicationController
  def index
    @season = Season.last
  end
end
