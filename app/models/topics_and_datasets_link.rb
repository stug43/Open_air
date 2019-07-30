class TopicsAndDatasetsLink < ApplicationRecord
	belongs_to :topic
	belongs_to :dataset

  validates :topic, presence: true
  validates :dataset, presence: true
  validate :only_one_link_between_dataset_and_topic

private

  def only_one_link_between_dataset_and_topic
    TopicsAndDatasetsLink.all.each do |topics_and_datasets_link|
      errors.add(:dataset, 'Ce topic et ce jeu de données sont déjà liés.') if (topics_and_datasets_link.dataset == dataset) && (topics_and_datasets_link.topic == topic) && (topics_and_datasets_link != self)
    end
  end

end
