class CreateSectors < ActiveRecord::Migration[5.2]
  def change
    create_table :sectors do |t|
      t.string :sector_name
      t.boolean :sufficient_staff
      t.integer :funding

      t.timestamps
    end
  end
end
