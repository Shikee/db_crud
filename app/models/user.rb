class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  
  has_many :post_user_likes
  has_many :likes , through: :post_user_likes,source: :post
  
  def is_liked?(post)
    PostUserLike.find_by(user_id: self.id, post_id: post.id).present?
  end
  
end
