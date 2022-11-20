require 'rails_helper'

RSpec.describe 'Boards', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/boards/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    context 'with valid params' do
      let(:board_params) do
        {
          name: 'John',
          email: 'example@example.com',
          height: 10,
          width: 10,
          bombs: 10,
          pattern: BoardService.call(height: 10, width: 10, bombs: 10)
        }
      end
      it 'creates a new Board' do
        expect { post '/boards', params: { board: board_params } }.to change(Board, :count).by(1)
      end
    end

    context 'with invalid params' do
      let(:board_params) do
        {
          name: 'John',
          email: ''
        }
      end
      it 'does not create a new Board' do
        expect { post '/boards', params: { board: board_params } }.to change(Board, :count).by(0)
      end
    end
  end

  describe 'GET /show' do
    let(:board) { create(:board) }
    it 'returns http success' do
      get "/boards/#{board.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
