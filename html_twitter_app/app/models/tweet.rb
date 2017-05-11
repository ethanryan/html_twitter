class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :users, through: :likes

###got below methods from here: http://stackoverflow.com/questions/34965952/how-to-add-likes-to-a-blog-rails?noredirect=1&lq=1

  # like the post
  def like(user)
    likes << Like.new(user: user)
  end

  # unlike the post
  def unlike(user)
    likes.where(user_id: user.id).first.destroy
  end

end
