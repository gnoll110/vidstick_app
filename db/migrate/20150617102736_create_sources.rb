class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :path

      t.timestamps null: false
    end
  end
end
