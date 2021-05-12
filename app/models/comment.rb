class Comment < ApplicationRecord
  include Visible
  belongs_to :article

  validates :Commenter, format: { with: /\A[a-zA-Z]+\z/,}, format: { with: /\A\d+\z/}
  validates :Comment, format: { with: /\A[a-zA-Z]+\z/,}, format: { with: /\A\d+\z/}
end
