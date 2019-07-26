# frozen_string_literal: true

class Dataset < ApplicationRecord
  has_many :topics
  has_many :dataset_collections

  validates :title, presence: true
  validates :db_link, presence: true
  validates :description, presence: true
  validates :dpsir_category, presence: true
  validates :dpsir_category, inclusion: { in: %w[Driver Pressure State Impact Response] }
end
