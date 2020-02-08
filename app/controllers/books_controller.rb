class BooksController < ApplicationController
    def index
        @books = Book.order_by_author_title
    end

    def show
        @book = Book.find(params[:id])
        @can_add = !BookListItem.contains?(current_user, @book)
    end

    def add

    end
end
