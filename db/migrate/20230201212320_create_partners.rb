class CreatePartners < ActiveRecord::Migration[5.2]
  def change
    create_table :partners do |t|
      t.string :name
      t.boolean :goal_achiever

      t.timestamps
    end
  end
end
