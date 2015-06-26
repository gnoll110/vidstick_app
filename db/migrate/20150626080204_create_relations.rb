class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.references :medium, index: true, foreign_key: true
      t.references :destination, index: true, foreign_key: true
      t.string :relation_code

      t.timestamps null: false
    end
  end
end
