class CreateTagListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_list_items do |t|
			t.belongs_to :tag
			t.integer :taggable_id
			t.string :taggable_type

      t.timestamps
    end

		add_index :tag_list_items, [:taggable_type, :taggable_id]
  end
end
