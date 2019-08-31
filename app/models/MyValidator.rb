class MyValidator < ActiveModel::Validator
  def validate(post)
    unless post.name.includes? 'Won\'t Believe' ' Secret' 'Top[number]' 'Guess'
    end
  end
end
