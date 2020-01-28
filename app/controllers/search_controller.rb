# frozen_string_literal: true

class SearchController < ApplicationController
  def show
    @search = Story.search(params.fetch(:search_query, ''))
  end
end
