class Tag < ApplicationRecord
	has_many :tag_list_items
	has_many :datasets, through: :tag_list_items, source: :taggable, source_type: "Dataset"
	has_many :topics, through: :tag_list_items, source: :taggable, source_type: "Topic"

	validates :tag_name, presence: true
end
