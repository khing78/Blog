class Comment < ApplicationRecord
  include Visible
  belongs_to :article

  validates :commenter, format: { with: /\A[a-zA-Z0-9]+\z/,}
  validates :body, format: { with: /\A[a-zA-Z0-9]+\z/,}
end
