class CreateHappinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :happiness do |t|
      t.references :user, null: false
      t.text :message

      t.timestamps
    end

    add_foreign_key :happiness, :users, on_delete: :cascade
  end
end
