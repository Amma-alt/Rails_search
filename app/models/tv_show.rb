class TvShow < ApplicationRecord

  include PgSearch::Model
  multisearchable against: [:title, :synopsis, :year]

end
