class AddAttributesToComments < ActiveRecord::Migration[7.2]
  def change
    add_column :comments, :content, :string
    add_reference :comments, :user, null: false, foreign_key: true
    add_reference :comments, :gossip, null: false, foreign_key: true
  end
end
