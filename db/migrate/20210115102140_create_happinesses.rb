class CreateHappinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :happiness_cards do |t|
      t.references :user, null: false
      t.text :message, null: false

      t.timestamps
    end

    add_foreign_key :happiness_cards, :users, on_delete: :cascade
  end
end
