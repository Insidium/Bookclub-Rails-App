class Book < ApplicationRecord
  belongs_to :author

  def self.order_by_author_title
    books = []
    Author.all.order(:last_name).each do | author |
      books += author.books.order(:title)
    end
    return books
  end

  def self.find_book(title, author_last_name)
    book = nil
    books = book.where("LOWER(title) = ?", title.downcase.strip)
    if books
      book = books.first
        if book && book.author.last_name.downcase != author_last_name.downcase.strip
          book = nil
        end
    end
  end

  def self.create_author(first_name, last_name)
    author = Author.find_author(first_name, last_name)
    if !author
      author = Author.new(first_name: first_name, last_name: last_name, id: author.id)
      author.save
    end
    return author
  end

  def self.create_book(title, author, genre)
    book = Book.find_book(title, author_last_name)
    if !book
      book = Book.new(title: title, genre: genre, author_id: author.id)
      book.save
    end
    return book
  end

end
