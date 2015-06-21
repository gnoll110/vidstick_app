class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :path

      t.timestamps null: false
    end
  end
end
