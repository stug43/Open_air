class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
			t.string :dpt_name
			t.string :dpt_code

      t.timestamps
    end
  end
end
