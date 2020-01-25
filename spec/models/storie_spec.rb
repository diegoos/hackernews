# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Story, type: :model do
  describe '.get' do
    let(:stories) { Story.get(2) }

    context 'with two stories' do
      it do
        expect(stories.size).to eq(2)
      end
    end

    context 'when item is a Story instance' do
      it do
        expect(stories.first.class).to eq(Story)
      end
    end
  end
end
