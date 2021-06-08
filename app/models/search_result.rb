class SearchResult < ApplicationRecord
    has_and_belongs_to_many :jokes
end
