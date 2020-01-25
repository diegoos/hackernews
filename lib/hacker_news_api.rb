# frozen_string_literal: true

# Hacker News API module
module HackerNewsApi
  include HTTParty
  base_uri 'https://hacker-news.firebaseio.com/v0'

  module_function

  # Get items from Hacker News API
  def item(id)
    get("/item/#{id}.json")
  end

  def top_stories
    get('/topstories.json')
  end
end
