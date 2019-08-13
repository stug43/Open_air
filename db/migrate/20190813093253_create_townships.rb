class CreateTownships < ActiveRecord::Migration[5.2]
  def change
    create_table :townships do |t|
			t.belongs_to :department, index: true
			t.string :township_name
			t.string :insee_code

      t.timestamps
    end
  end
end
