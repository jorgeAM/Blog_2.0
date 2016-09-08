class ArticlesController < ApplicationController
	#get -> /articles
	def index
		#si no tuviera "@" la variable no podemos llamarla
		#en la vista
		@articles = Article.all
	end

	#get -> /articles/:id
	def show
		@article = Article.find(params[:id])
	end

	#get -> /articles/new
	def new
		#creamos pero no se guarda en la DB
		@article = Article.new
	end

	#post -> /articles
	def create
		@article = Article.new(title: params[:article][:title],
													body: params[:article][:body])
		@article.save
		redirect_to @article
	end

	#put -> /articles/:id
	def update
		
	end

end
