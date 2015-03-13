class CreateRcConstructions < ActiveRecord::Migration
  def change
    create_table :rc_constructions do |t|
      t.string :c_id
      t.string :title
      t.text :description
      t.string :link
      t.datetime :published
      t.datetime :updated
      t.text :coord

      t.timestamps null: false
    end
  end
end
