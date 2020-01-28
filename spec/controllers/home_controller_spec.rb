# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    context 'with http success' do
      it do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    context 'when render the index template' do
      it do
        get :index
        expect(response).to render_template('index')
      end
    end
  end
end
