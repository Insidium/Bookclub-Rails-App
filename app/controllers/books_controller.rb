class BooksController < ApplicationController
    def index
        @books = Book.order_by_author_title
    end

    def show
        @book = Book.find(params[:id])
    end

end
