class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :filename
      t.string :modified_filename

      t.timestamps null: false
    end
  end
end
