class Follow < ApplicationRecord
  belongs_to :follower, class_name: :User,foreign_key:"follower_id"
  belongs_to :followed, class_name: :User,foreign_key:"followed_id"
  enum :status, {pending:0, accepted:1}, presense:true
end
