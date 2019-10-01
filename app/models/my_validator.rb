class MyValidator < ActiveModel::Validator
  
    def validate(record)
      if record.title
        unless record.title.include? "Won't Believe" || "Secret" || "Top [number]" || "Guess"
        record.errors[:title] << 'Need a clickbait title'
      end
      end
    end
    
end 