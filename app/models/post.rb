class Post < ApplicationRecord
    # Object Lifecycle callback
    
    # validations
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    before_validation :capitalize_category_name
    # validates :title, format: {with: /Won't Believe|Secret|Top \d|Guess/i, message: "Not clickbaity enough"}

    validate :title_must_be_clickbaity

    def title_must_be_clickbaity
        if [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i].none? {|pattern| pattern.match(title)}
            errors.add(:title, "Not clickbaity enough")
        end
    end
   
    def capitalize_category_name
        if self.category 
        self.category = self.category.split("-").map(&:capitalize).join("-")
        end
    end
    
end
