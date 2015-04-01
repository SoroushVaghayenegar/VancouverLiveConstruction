class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.boolean :pref_ip
      t.boolean :pref_up
      t.boolean :pref_rc

      t.timestamps null: false
    end
  end
end
