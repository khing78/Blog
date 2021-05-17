class Store < ApplicationRecord
    include ActiveModel::Validations
    belongs_to :article, optional: true 

    validates :name , presence: true, format: { with: /\A[a-zA-Z0-9]+\z/}, length: { maximum:10}
    validates :location , presence: true, format: { with: /\A[a-zA-Z0-9]+\z/}, length: { maximum:50}
    validates :code , presence: true, format: { with: /\A[a-zA-Z0-9]+\z/}, length: { maximum:10}
    validates :article_amount, numericality: { only_integer: true }
    
    validate :validate_article_id
    
    private
        def validate_article_id
            if (article_id != nil)
                errors.add(:article_id, "Id is invalid") unless
                Article.exists?(self.article_id)
                puts self.article_id
            end
        end
    
end
