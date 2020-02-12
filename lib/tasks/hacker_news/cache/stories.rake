# frozen_string_literal: true

require Rails.root.join('lib', 'hacker_news_api.rb')

namespace :hacker_news do # rubocop:disable Metrics/BlockLength
  namespace :cache do # rubocop:disable Metrics/BlockLength
    desc 'Update JSON cache with last stories'
    task :update_stories, [:story_type] do |_t, args|
      puts 'Redis is not connected' unless redis_is_ok?

      type = "#{args[:story_type]}_stories"

      redis = Redis.new
      cache = redis.get(type)

      stories = HackerNewsApi.send(type)

      if cache.present?
        last_story_id = cache.first['id']
      else
        cache = []
      end

      stories.each do |story|
        break if last_story_id == story

        cache.prepend HackerNewsApi.item(story).parsed_response
      end

      redis.set(type, cache)
    end

    desc 'Generate the JSON cache with all top and new stories. This task reset the cache if exist.' # rubocop:disable Layout/LineLength
    task :stories, [:limit] do |_t, args|
      puts 'Redis is not connected' unless redis_is_ok?

      limit = args[:limit].present? ? args[:limit].to_i : nil

      top_stories = HackerNewsApi.retrieve_stories_data(15)
      new_stories = HackerNewsApi.retrieve_stories_data(limit, :new)

      redis = Redis.new

      # Generate top stories cache json
      redis.set('top_stories', top_stories.to_json)
      # Generate new stories cache json
      redis.set('new_stories', new_stories.to_json)
    end

    # Methods

    def redis_is_ok?
      Redis.new.info.present?
    rescue StandardError
      false
    end
  end
end
