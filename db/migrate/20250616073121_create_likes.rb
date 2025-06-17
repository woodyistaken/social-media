class CreateLikes < ActiveRecord::Migration[8.0]
  def change
    create_table :likes do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.timestamps
    end
  end
end
