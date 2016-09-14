class Category < ActiveRecord::Base
	validates_presence_of :name
	#relacion * - * con article mediante hasCategory
	has_many :has_categories
	has_many :articles, through: :has_categories
end
