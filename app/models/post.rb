class Post < ActiveRecord::Base
   validates (:post_content, { :length => { :minimum => 250 } })
  
  validates: :post_title, presence: true
  
  validates(:post_summary, { :length => { :maximum => 250 } })
  
  validates :post_category, inclusion: { in: %w(Fiction Non-Fiction) }
  
   validate :is_clickbait?
  
   CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end

end
