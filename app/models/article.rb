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
	#relación * - * con categoria
	has_many :has_categories
	has_many :categories, through: :has_categories

	#validacion para poder usar paperclip
	has_attached_file :cover, styles: { medium: "1280x720>", thumb: "800x600>" }
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

	#despues de crear el article
	after_create :save_categories

	#custom setter (metodo set)
	def categories=(categories)
		@categories = categories
	end

	def update_visits_count
		self.update(visits_count: self.visits_count + 1)
	end

	private
	def save_categories
		#raise @categories.to_yaml
		@categories.each do |category_id|
			HasCategory.create(category_id: category_id, article_id: self.id)			
		end
	end

	def set_visits_count
		self.visits_count = 0		
	end
end
