class BooksController < ApplicationController
    def index
        @books = Book.order_by_author_title
    end

    def show
        @book = Book.find(params[:id])
        @can_add = !BookListItem.contains?(current_user, @book) if user_signed_in?
    end

    def add
        book = Book.find(params[:id])
        current_user.books.push(book)
        if current_user.save
            flash[:notice] = "Success! That book has been added to your list."
            redirect_to book_list_items_path 
        else
            flash[:alert] = "Oops! There was a problem adding that book to your list."
            redirect_back(fallback_location books_path)
        end
    end

    def new
        @book = Book.new
    end

    def create
        author = Author.create_author(params[:book][:first_name], params[:book][:last_name])
        book = Book.create_book(params[:book][:title], author, params[:book][:genre])
        BookListItem.create_book_list_item(current_user, book)
        rescue
            flash[:alert] = "Oops! There was a problem adding that book."
            # redirect_back(fallback_location: books_path)
        ensure
            redirect_to book_list_items_path
    end

end
