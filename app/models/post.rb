class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :title_validator

  private
  def title_validator
    if self.title
      words = self.title
      word_list = words.split(' ')
      if word_list.none?("Won't")
        errors.add(:title, "must be clickbait")
      end
    end
  end
  
end
