Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Show Books
  root to: "books#index"
  get "/books", to: "books#index", as: "books"

  # Add book to list
  get "books/add", to: "books#add", as: "add_book_to_list"

  # Create new book
  get "/books/new", to: "books#new", as: "new_book"
  post "/books", to: "books#create"

  # Remove book entry on my list
  delete "books/:id", to: "book_list_items#destroy"

  # Show individual Book
  get "/books/:id", to: "books#show", as: "book"

  # Show Authors
  get "/authors", to: "authors#index", as: "authors"

  # Show individual Author
  get "/authors/:id", to: "authors#show", as: "author"

  #Show booklist items
  get "/mylist", to: "book_list_items#index", as: "book_list_items"

  # Edit for trade
  get "/mylist/:id/edit", to: "book_list_items#edit", as: "edit_book_list_item"
  put "/mylist/:id", to: "book_list_items#update"
  patch "/mylist/:id", to: "book_list_items#update", as: "book_list_item"

end
