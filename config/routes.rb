Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Show Books
  root to: "books#index"
  get "/books", to: "books#index", as: "books"

  # Show individual Book
  get "/books/:id", to: "books#show", as: "book"

  # Add book to list
  get "books/add", to: "books#add", as: "add_book_to_list"

  # Show Authors
  get "/authors", to: "authors#index", as: "authors"

  # Show individual Author
  get "/authors/:id", to: "authors#show", as: "author"

  #Show booklist items
  get "/mylist", to: "book_list_items#index", as: "book_list_items"


end
