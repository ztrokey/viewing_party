class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def search(movie_search)
    where('user_name ILIKE', "%#{movie_search}%")
  end
end
