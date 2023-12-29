class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
