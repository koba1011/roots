class AddshareUrlToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :share_url, :string
  end
end
