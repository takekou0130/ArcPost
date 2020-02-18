class Post < ApplicationRecord
    validates :user_id, {presence: true}
    # geocodeの設定
    geocoded_by :address
    after_validation :geocode, if: :address_changed?

    def user #投稿に対しその投稿したユーザーを返す
     return User.find_by(id: self.user_id)
    end
    def like_counter #投稿に対しそのいいね数を返す
        return Like.where(post_id: self.id).count
    end
    
end
