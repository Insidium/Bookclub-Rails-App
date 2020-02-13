class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  def self.get_average_rating(book)
    reviews =  Review.where(book_id: book.id).average(:rating)
    return reviews
end

end
