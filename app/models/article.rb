class Article < ApplicationRecord
    include Visible
    include ActiveModel::Validations
    include ActiveModel::Validations::Callbacks

    has_many :comments, dependent: :destroy

    # before_validation :read_check

    validates :title, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/
        }
    validates :body, presence: true, length: { minimum:10}, 
        format: { with: /\A[a-zA-Z0-9]+\z/}

    validates :read, inclusion: [true, false]
    validates :read, exclusion: [nil]
        
    protected
        def read_check
            if :read.nil?
                puts "#{:read.class} sssssssssssssssssssssssssssssssssssssssssssssssssssss" 
            end
        end
end
