class BookListItem < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def self.contains?(current_user, book)
    return current_user.books.where(id: book.id).length > 0
  end

  def self.create_book_list_item(current_user, book)
    if (current_user.books.where(id: book.id).length == 0)
      current_user.books.push(book)
      current_user.save
    end
  end

  def self.book_list_item_id(current_user, book)
    return BookListItem.where("book_id = ? AND user_id = ?", book, current_user).first.id
  end

end
