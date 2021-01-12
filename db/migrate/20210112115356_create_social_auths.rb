class CreateSocialAuths < ActiveRecord::Migration[6.1]
  def change
    create_table :social_auths do |t|
      t.references :user, null: false
      t.string :provider, null: false, limit: 32
      t.string :uid, null: false, limit: 191
      t.string :access_token, null: false
      t.string :secret, null: false
      t.json :extra_data

      t.timestamps
    end

    add_index :social_auths, [:provider, :uid], unique: true
    add_foreign_key :social_auths, :users, on_delete: :cascade
  end
end
