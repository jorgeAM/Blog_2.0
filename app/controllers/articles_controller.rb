class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]
	before_action :authenticate_editor!, only: [:new, :create, :update]
	before_action :authenticate_admin!, only: [:destroy, :publish]

	#get -> /articles
	def index
		#si no tuviera "@" la variable no podemos llamarla
		#en la vista
		#@articles = Article.all
		@articles = Article.publicados
	end

	#get -> /articles/:id
	def show
		@article = Article.find(params[:id])
		@article.update_visits_count
		#se creare un nuevo comentario
		@comment = Comment.new
	end

	#get -> /articles/new
	def new
		#creamos pero no se guarda en la DB
		@article = Article.new
		@categories = Category.all
	end

	def edit
		@article = Article.find(params[:id])
	end

	#post -> /articles
	def create
		@article = current_user.articles.new(article_params)
		@article.categories = params[:categories]
		if @article.save
			redirect_to @article
		else
			#si no se guardo render a new
			render :new
		end
	end

	#delete -> /articles/:id
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	#put -> /articles/:id
	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article			
		else
			render :edit
		end
	end

	def publish
		@article = Article.find(params[:id])
		@article.publish!
		redirect_to @article
	end

	private
	def article_params
		params.require(:article).permit(:title, :body, :cover, :categories)
	end

end