class RemoveReference < ActiveRecord::Migration[5.2]
  def change
		remove_column :datasets, :topic_id, index: true
  end
end
