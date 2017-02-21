class PostsController < ApplicationController
  def index
    @posts = Post.all
    @current_user_posts = current_user.posts
  end
  def new 
  end
  def create
    @post = current_user.posts.build(title: params[:title],
    content: params[:content],user_id: current_user.id)
    if @post.save 
      redirect_to '/posts/index'
    else
      redirect_to '/posts/new'
    end
  end
  def show
   
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(title: params[:title],content: params[:content])
      redirect_to '/posts/index'

    else
      redirect_to "/posts/#{@post.id}/edit"
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/posts/index'

  end
  def like
  end
end
