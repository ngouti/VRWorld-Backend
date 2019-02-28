class Image < ApplicationRecord
    has_many :collections
    has_many :users, through: :collections

    def user=(user_id)
          user = User.find_or_create_by(user_id)
          self.user << user
        end
   
end
