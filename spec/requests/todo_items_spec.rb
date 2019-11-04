require 'rails_helper'

RSpec.describe 'Todo Items', type: :request do
  describe 'GET /todo_items' do
    it 'renders index' do
      get todo_items_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /todo_items/new' do
    it 'creates an item' do
      get new_todo_item_path
      expect(response).to render_template(:new)

      post '/todo_items', params: { todo_item: { content: 'My item', completed_at: nil } }

      expect(response).to redirect_to(assigns(:item))
      follow_redirect!

      expect(response).to render_template(:index)
      expect(response.body).to include('Todo item was successfully created.')
    end
  end

  describe 'PATCH /todo_items/:id/complete' do
    before do
      @todo_item = TodoItem.create(id: 3, content: 'Test', completed_at: nil)
    end

    it 'marks an item as complete' do
      patch '/todo_items/3/complete', params: {
        authenticity_token: '5F95uq5GyZvwTFelTbo2Xc8mApUDD0fQ3O+dVOQgao0liU4izwso+sjKQGNdEHXAu95hsXocPFceyh31hRHQ+w==',
        id: '3'
      }
      @todo_item.reload
      expect(@todo_item.completed_at).not_to be nil
      follow_redirect!

      expect(response.body).to include('Todo item was successfully completed.')
    end
  end
end
