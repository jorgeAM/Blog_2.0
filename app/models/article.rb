class Article < ActiveRecord::Base
	#validacion de presencia
	validates_presence_of :title, :body
	validates :title, uniqueness: true
	validates_length_of :body, {minimum: 20}

	#validacion para el visits_count
	before_create :set_visits_count

	#referencia a modelo USER
	belongs_to :user
	#referencia como modelo COMMENTS
	has_many :comments

	#validacion para poder usar paperclip
	has_attached_file :cover, styles: { medium: "1280x720>", thumb: "800x600>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

	def update_visits_count
		self.update(visits_count: self.visits_count + 1)
	end

	private
	def set_visits_count
		self.visits_count = 0		
	end
end
