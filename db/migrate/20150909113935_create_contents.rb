class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.references :user, index: true, foreign_key: true
      t.text :text
      t.string :title

      t.timestamps null: false
    end
  end
end
