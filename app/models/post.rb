class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :title_validation

  private
  def title_validation
    if self.title
      words = self.title
      @word_list = words.split(' ')

      case @word_list
      when @word_list.include?("Won't")
        true
      when @word_list.include?("Believe")
        true
      when @word_list.include?("Secret")
        true
      when @word_list.include?("Top")
        true
      when @word_list.include?("Guess")
        true
      else
        false
      end

    end
  end
  
end
