class Author < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :phone_number, length: { is: 10 }

    # validates_presence_of :email, :name, :phone_number
end
