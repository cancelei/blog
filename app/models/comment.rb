class Comment < ApplicationRecord
  attr_accessor :content, :author
  belongs_to :blog_post

  def initialize(content, author)
    @content = content
    @author = author
  end
end
