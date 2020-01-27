# frozen_string_literal: true

class Story
  include ActiveModel::Model

  attr_accessor :by, :descendants, :id, :kids, :score,
                :time, :title, :type, :url

  alias_attribute :comments, :kids

  # Get stories from API
  # We can pass a number of stories that we need
  # The default amount of stories is 10
  # ===== Examples
  #
  #   Story.all # => Return all stories from API (very slow)
  #   Story.all(5) # => Return first 5 stories from API
  #
  def self.all(limit = 10)
    stories_cache = HackerNewsApi.load_stories_cache

    stories_list = if stories_cache.present?
                     stories_cache.first(limit)
                   else
                     HackerNewsApi.retrieve_stories_data(limit)
                   end

    stories_list.map do |story|
      Story.new(story)
    end
  end

  # Count number of comments
  #
  #   Story.all.first.comments_count
  #
  def comments_count
    comments.size
  end
end
