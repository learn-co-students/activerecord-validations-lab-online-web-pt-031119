class PostValidator < ActiveModel::EachValidator
    def validate(record)
        unless clickbait?(record.title)
            record.errors[:title] << 'Title not clickbait-y enough!'
        end
    end

    private
        def clickbait?(title)
            if title
                title =~ /Top\s\d+/ || ["Won't Believe", "Secret", "Guess"].any? {|w| title.include?(w)}
            end
        end
end
