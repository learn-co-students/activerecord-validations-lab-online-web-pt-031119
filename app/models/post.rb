class Post < ActiveRecord::Base

	validates :title, presence: true
	# validates :title, inclusion: {in: %w("Won't Believe"+, "Secret"+, "Top[number]"+, "Guess"+)}
	# validates :title, inclusion: {in: ["Won't Believe", "Secret", "Top[number]", "Guess"]}
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
	validate :title_contains_this

	def title_contains_this
		if self.title
			if ["Won't Believe", "Secret", "Top[number]", "Guess"].any? { |s| self.title.include? s}
			else
				errors.add(:title, "The given title is not in the list.")
			end
		end
	end

end
