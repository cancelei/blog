class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :user
end
