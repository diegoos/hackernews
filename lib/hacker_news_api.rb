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

  # Get the new stories
  def new_stories
    get('/newstories.json')
  end

  # Get top stories id list
  def top_stories
    get('/topstories.json')
  end

  # Retrieve the stories data from API
  # We can pass the limit and type of stories to retrieve
  # For default we get the top stories
  #
  #   retrieve_stories_data(10) # => Get first 10 top stories
  #   retrieve_stories_data(10, :new) # => Get first 10 new stories
  #
  def retrieve_stories_data(limit = nil, type = :top)
    response = send("#{type}_stories")

    return [] unless response.code == 200

    stories = limit ? response.first(limit) : response

    all_stories = []

    stories.each do |story|
      item = item(story).parsed_response
      next unless item.present?

      all_stories << item if item['type'] == 'story'
    end

    all_stories
  end

  # Load stories from JSON cache
  def load_stories_cache(type = :top)
    cache_file = Rails.root.join('tmp', 'hacker_news', "#{type}_stories.json")

    return nil unless File.exist?(cache_file)

    JSON.parse(File.read(cache_file))
  end
end
