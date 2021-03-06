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

  def update
    @post = Post.find(params[:id])
    @post.update(post_params) 
    flash[:alert] = "Post updated now hombre."
    redirect_to(post_path(@post))
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Your post has been created."
      redirect_to @post
    else
      flash[:alert] = "Halt, you fiend! You need an image to post here!"
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "Problem solved!  Post deleted."
    redirect_to posts_path
  end
end

  private

  def post_params
  	params.require(:post).permit(:caption, :image)
  end

