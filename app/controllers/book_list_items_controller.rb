class BookListItemsController < ApplicationController
    
    before_action :authenticate_user!
    
    def index
        @books = current_user.books
    end

    def destroy
        item_id = BookListItem.book_list_item_id(current_user, params[:id])
        BookListItem.destroy(item_id)
        flash[:notice] = "Book was successfully removed from your list."
        redirect_to book_list_items_path
    end

    def edit
        @book_list_item = BookListItem.find(BookListItem.book_list_item_id(current_user, params[:id]))
    end

    def update
        @book_list_item = BookListItem.find(params[:id])
        @book_list_item.for_trade = params[:book_list_item][:for_trade]
        if @book_list_item.save
            redirect_to book_list_items_path
        end
    end

end
