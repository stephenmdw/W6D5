require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    #rails creates getter/setter to columns
    validates  :birth_date, :name, presence: true
    validates :sex, presence: true, inclusion: { in: ['M', 'F'] }
    CAT_COLORS = ['Brown', 'Black', 'White', 'Ginger', 'Grey', 'Cream', 'Cinnamon', 'Fawn' ]
    validates :color, presence: true, inclusion: { in: CAT_COLORS }
    validate :birth_date_cannot_be_future
    
    def birth_date_cannot_be_future
        errors.add(:birth_date, "cannot be in the future") unless birth_date < Date.today
    end

    def age
        time_ago_in_words(birth_date)
    end

end
