class Article < ActiveRecord::Base
	#validacion de presencia
	validates_presence_of :title, :body
	validates :title, uniqueness: true
	validates_length_of :body, {minimum: 20}

	#validacion para el visits_count
	before_create :set_visits_count

	#referencia a modelo USER
	belongs_to :user

	def update_visits_count
		self.update(visits_count: self.visits_count + 1)
	end

	private
	def set_visits_count
		self.visits_count = 0		
	end
end
