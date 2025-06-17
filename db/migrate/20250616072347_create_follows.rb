class CreateFollows < ActiveRecord::Migration[8.0]
  def change
    create_table :follows do |t|
      t.belongs_to :follower, foreign_key:{to_table: :users}
      t.belongs_to :followed, foreign_key:{to_table: :users}
      t.integer :status
      t.timestamps
    end
  end
end
