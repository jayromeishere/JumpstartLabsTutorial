class Tag < ActiveRecord::Base
    has_many :taggings
    has_many :articles, through: :taggings #expressing many-to-many relationship between articles and tags, using the "intermediary" :taggings model 
end
