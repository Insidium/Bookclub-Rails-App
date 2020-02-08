class BookListItem < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def self.contains?(current_user, book)
    return current_user.books.where(id: book.id).length > 0
  end

end
