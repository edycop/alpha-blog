# frozen_string_literal: true

require 'rails_helper'

# Functional tests for Category controller
RSpec.describe 'Categories', type: :request do
  let(:category) { Category.create(name: 'Sports') }
  let!(:admin_user) do
    User.create(
      username: 'caldon', email: 'ecaldon@gmail.com',
      password: 'password', admin: true
    )
  end

  describe 'GET /index' do
    it 'returns http success' do
      # get '/categories/index'
      get categories_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      sign_in_as(admin_user)
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

    context 'when is admin' do
      it 'returns http success' do
        sign_in_as(admin_user)
        expect { subject }.to change { Category.count }.by(1)

        expect(subject).to redirect_to(category_path(assigns(:category)))
        # expect(subject).to redirect_to(action: :show, id: assigns(:category).id)
      end
    end

    context 'when is not admin' do
      it 'redirects to index categories' do
        expect { subject }.to_not change { Category.count }

        expect(subject).to redirect_to(categories_path)
      end
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
