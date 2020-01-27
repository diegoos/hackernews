# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Story, type: :model do
  let(:stories) { described_class.all(2) }

  describe '.all' do
    context 'with two stories' do
      it { expect(stories.size).to eq(2) }
    end

    context 'when item is a Story instance' do
      it { expect(stories.first.class).to eq(described_class) }
    end
  end

  describe '#comment_count' do
    it 'with five comments' do
      story = stories.first.dup
      story.comments = [1, 2, 3, 4, 5]

      expect(story.comments_count).to eq(5)
    end
  end
end
