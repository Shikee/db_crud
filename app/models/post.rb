class Post < ActiveRecord::Base
    belongs_to :user
    
    has_many :post_user_likes
    has_many :likes , through: :post_user_likes,source: :user

end
