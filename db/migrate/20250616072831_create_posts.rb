class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :body
      t.belongs_to :user
      t.timestamps
    end
  end
end
