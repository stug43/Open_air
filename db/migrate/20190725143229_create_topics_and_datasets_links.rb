class CreateTopicsAndDatasetsLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :topics_and_datasets_links do |t|

      t.timestamps
			t.belongs_to :topic, :dataset, index: true

    end
  end
end
