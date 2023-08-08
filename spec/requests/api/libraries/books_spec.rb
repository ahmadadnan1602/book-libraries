require 'swagger_helper'

RSpec.describe 'Api::Libraries::Books', type: :request do
  path '/api/libraries/{library_id}/books' do
    get 'Retrieves a list of books' do
      tags 'Books'
      produces 'application/json'
      parameter name: :library_id, in: :path, type: :integer, required: true

      response '200', 'books found' do
        schema type: :array,
          items: {
            properties: {
              id: { type: :integer },
              title: { type: :string },
              user_id: { type: :integer }
            },
            required: ['id', 'title']
          }

        examples 'application/json' => [
          {
            id: 1,
            title: 'Sample Book 1',
            user_id: 123
          },
          {
            id: 2,
            title: 'Sample Book 2',
            user_id: 456
          }
        ]

        run_test! do
          library = FactoryBot.create(:library) # Use FactoryBot to create a test library
          user = FactoryBot.create(:user)
          user1 = FactoryBot.create(:user, email: "test@test.com")
          book1 = FactoryBot.create(:book, library: library, title: 'Sample Book 1', user_id: user.id)
          book2 = FactoryBot.create(:book, library: library, title: 'Sample Book 2', user_id: user1.id)

          get "/api/libraries/#{library.id}/books"
          expect(response).to have_http_status(:ok)
          expect(JSON.parse(response.body)).to eq([
            {
              'id' => book1.id,
              'title' => 'Sample Book 1',
              'user_id' => user.id
            },
            {
              'id' => book2.id,
              'title' => 'Sample Book 2',
              'user_id' => user1.id
            }
          ])
        end
      end

      response '404', 'library not found' do
        run_test! do
          library_id = 999 # Replace with a non-existent library_id
          get "/api/libraries/#{library_id}/books"
          expect(response).to have_http_status(:not_found)
        end
      end
    end
  end
end
