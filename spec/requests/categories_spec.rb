# frozen_string_literal: true

require 'rails_helper'

# Functional tests for Category controller
RSpec.describe 'Categories', type: :request do
  let(:category) { Category.create(name: 'Sports') }

  describe 'GET /index' do
    it 'returns http success' do
      # get '/categories/index'
      get categories_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      # get '/categories/new'
      get new_category_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      # get '/categories/show'
      get category_path(category)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /new' do
    subject { post categories_path(params: { category: { name: 'Travel' } }) }

    it 'returns http success' do
      expect { subject }.to change { Category.count }.by(1)

      expect(subject).to redirect_to(category_path(assigns(:category)))
      # expect(subject).to redirect_to(action: :show, id: assigns(:category).id)
    end
  end

  # describe 'GET /destroy' do
  #   xit 'returns http success' do
  #     get '/categories/destroy'
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'GET /update' do
  #   xit 'returns http success' do
  #     get '/categories/update'
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
