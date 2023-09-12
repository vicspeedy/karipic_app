class Publication < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :users, through: :comments
    has_one_attached :photo
end
