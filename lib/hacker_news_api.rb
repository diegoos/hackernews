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

  # Get top stories id list
  def top_stories
    get('/topstories.json')
  end

  # Retrieve the stories data from API
  def retrieve_stories_data(limit)
    stories = top_stories

    return [] unless stories.code == 200

    all_stories = []

    stories.first(limit).each do |story|
      all_stories << item(story).parsed_response
    end

    all_stories
  end
end
