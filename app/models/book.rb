class Book < ApplicationRecord
  belongs_to :author

  def self.order_by_author_title
    books = []
    Author.all.order(:last_name).each do | author |
      books += author.books.order(:title)
    end
    return books
  end

end
