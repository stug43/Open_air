# frozen_string_literal: true

class Dataset < ApplicationRecord
  has_many :dataset_collections
	has_many :topics_and_datasets_links
  has_many :topics, through: :topics_and_datasets_links

  validates :title, presence: true
  validates :db_link, presence: true
  validates :description, presence: true
  validates :dpsir_category, presence: true
  validates :dpsir_category, inclusion: { in: %w[Driver Pressure State Impact Response] }
end
