class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :user

  scope :draft, -> { where(published_at: nil)}
  scope :published_at, -> { where("published_at <= ?", Time.current)}
  scope :scheduled, -> { where("published_at > ?", Time.current)}
end
