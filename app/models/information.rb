class Information < ApplicationRecord
    belongs_to :admin

    validates :title, presence: true, length: { in: 3..50 } 
    validates :content, presence: true

end

