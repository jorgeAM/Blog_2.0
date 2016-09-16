# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
	validates_presence_of :name
	#relacion * - * con article mediante hasCategory
	has_many :has_categories
	has_many :articles, through: :has_categories
end
