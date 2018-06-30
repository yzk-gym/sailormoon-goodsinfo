class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :date
      t.text :image

      t.timestamps
    end
  end
end
