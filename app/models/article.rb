class Article < ApplicationRecord
    include Visible
    include ActiveModel::Validations
    include ActiveModel::Validations::Callbacks

    has_many :comments, dependent: :destroy
    has_many :stores, dependent: :nullify

    # before_validation :read_check
    # format: { with: /\A[a-zA-Z0-9]+\z/}
    validates :title, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/}
    validates :body, presence: true, length: { minimum:10}
    validate :body_validate

    # validates :read, inclusion: [true, false]
    # validates :read, exclusion: [nil]
        
    private
        def body_validate
            errors.add(:body, "text must be end with end word") unless 
            body.downcase.end_with?('end')
        end
end
