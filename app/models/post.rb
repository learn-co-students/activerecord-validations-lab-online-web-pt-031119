class Post < ActiveRecord::Base

	validates :title, presence: true
	# validates :title, inclusion: {in: %w("Won't Believe"+, "Secret"+, "Top[number]"+, "Guess"+)}
	# validates :title, inclusion: {in: ["Won't Believe", "Secret", "Top[number]", "Guess"]}
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: %w(Fiction, Non-Fiction)}

end
