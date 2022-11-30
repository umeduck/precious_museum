class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title,   null: false
      t.text :text
      t.references :user, null: false, forein_key: true

      t.timestamps
    end
  end
end
