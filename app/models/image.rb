class Image < ApplicationRecord
    has_many :users
    has_many :users, through: :collections

end
