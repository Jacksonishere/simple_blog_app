class Article < ApplicationRecord
    #When you create a model, the columns/fields you define are implicitly added as attributes/props in the model class.
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
end
