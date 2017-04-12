class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new
	  @post.title = params[:title]
	  @post.description = params[:description]
	  @post.save
	  redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])
		#@post.update(title: params[:title], description: params[:description])
		@post.update(params.require(:post))
		#need to require the :post because its attributes are
		#now nested within the post hash with the new post hash structure
		#introduced by form_for in the edit form 
	  redirect_to post_path(@post)
	end
end
