# frozen_string_literal: true

# Hacker News API module
module HackerNewsApi
  include HTTParty
  base_uri 'https://hacker-news.firebaseio.com/v0'

  # Get items from Hacker News API
  def item(id)
    get("/item/#{id}.json")
  end

  def top_stories
    get('/topstories.json')
  end

  module_function

  def retrieve_top_stories(limit)
    stories = top_stories

    return [] unless stories.code == 200

    all_stories = []

    stories.first(limit).each do |story|
      all_stories << item(story).parsed_response
    end

    all_stories
  end
end
