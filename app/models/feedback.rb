class Feedback < ApplicationRecord
    extend Mobility
    translates :name, type: :string
    translates :email, type: :string
    translates :role, type: :string
    translates :feedback, type: :text
end
