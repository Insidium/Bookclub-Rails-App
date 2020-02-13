class Book < ApplicationRecord
  belongs_to :author
  has_many :reviews

  def self.order_by_author_title
    books = []
    Author.all.order(:last_name).each do | author |
      books += author.books.order(:title)
    end
    return books
  end

  def self.find_book(title, author_last_name)
    book = nil
    books = Book.where("LOWER(title) = ?", title.downcase.strip)
    if (books)
      book = books.first
        if (book && book.author.last_name.downcase != author_last_name.downcase.strip)
          book = nil
        end
    end
    return book
  end

  def self.create_book(title, author, genre)
    book = Book.find_book(title, author.last_name)
    if (!book)
      book = Book.new(title: title, genre: genre, author_id: author.id)
      book.save
    end
    return book
  end

end
