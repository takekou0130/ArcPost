class Post < ApplicationRecord
    validates :user_id, {presence: true}

    def user #投稿に対しその投稿したユーザーを返す
     return User.find_by(id: self.user_id)
    end
end
