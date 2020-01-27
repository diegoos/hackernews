# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @stories = Story.all(2)
  end
end
