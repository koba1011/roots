class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :caption,   null: false
      t.text :describe
      t.string :place
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end
