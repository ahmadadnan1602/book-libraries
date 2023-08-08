class Api::Libraries::BooksController < ApplicationController
	def index
    library = Library.find(params[:library_id])
    books = library.books
    render json: books, each_serializer: BookSerializer
  end
end
