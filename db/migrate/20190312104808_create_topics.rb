# frozen_string_literal: true

class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :highlighted_category
      t.string :title
      t.text :short_description

      t.timestamps
    end
  end
end
