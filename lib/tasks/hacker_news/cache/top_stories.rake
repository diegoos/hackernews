# frozen_string_literal: true

namespace :hacker_news do # rubocop:disable Metrics/BlockLength
  namespace :cache do
    desc 'Update JSON cache with last stories'
    task :update_top_stories do
      stories = HackerNewsApi.top_stories

      cache = JSON.parse(File.read(cache_file))
      last_story_id = cache.first['id']

      stories.each do |story|
        break if last_story_id == story

        cache.prepend HackerNewsApi.item(story).parsed_response
      end

      File.open(cache_file, 'w+') do |f|
        f.write(cache.to_json)
      end
    end

    desc 'Generate the JSON cache with all stories. This task reset the cache if exist.' # rubocop:disable Layout/LineLength
    task :top_stories do
      stories = HackerNewsApi.retrieve_stories_data(10)

      File.open(cache_file, 'w+') do |f|
        f.write(stories.to_json)
      end
    end

    def cache_file
      cache_file = Rails.root.join('tmp', 'hacker_news', 'top_stories.json')
      cache_dir = File.dirname(cache_file)

      Dir.mkdir(cache_dir) unless File.directory?(cache_dir)

      cache_file
    end
  end
end
