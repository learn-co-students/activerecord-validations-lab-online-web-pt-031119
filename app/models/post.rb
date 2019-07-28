class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    validate :include_phrase?
    
   PATTERNS = [/Won't Believe/i, /Secret/i, /Guess/i, /Top [0-9]+/]  

    def include_phrase?
       if PATTERNS.none? {|pat| pat.match(self.title)}   
           errors.add(:title, "must include clickbait")
       end
    end  
       


       
    
end

 

# validates :title, inclusion: { in: %w("Won't Believe" "Secret" "Top[number]" "Guess") }


# def validate(record)
#     unless record.title "Won't Believe" || record.title "Secret" || record.title "Top[number]" 
#         || record.title "Guess"
#          record.errors[:title] << "Need a better title please!"
#     end 
# end
