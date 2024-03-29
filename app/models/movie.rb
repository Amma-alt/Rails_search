class Movie < ApplicationRecord
  belongs_to :director

include PgSearch::Model
multisearchable against: [:title, :synopsis, :year, :first_name, :last_name]

pg_search_scope :global_search,
  against: [ :title, :synopsis ],
  associated_against: {
    director: [ :first_name, :last_name ]
  },
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
}
end
