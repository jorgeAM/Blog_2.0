class Article < ActiveRecord::Base
	#validacion de presencia
	validates_presence_of :title, :body
	validates :title, uniqueness: true
	validates_length_of :body, {minimum: 20}
end
