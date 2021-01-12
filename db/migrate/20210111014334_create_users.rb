class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :screen_name, null: false
      t.string :name, null: false
      t.string :profile_image_url, null: false

      t.timestamps
    end

    add_index :users, :screen_name, unique: true
  end
end
