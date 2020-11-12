class PostsController < ApplicationController
  def index
    @posts = Post.all.order(checked: "ASC")
  end

  def create
    post = Post.create(content: params[:content], checked: true)
    # checked: trueは不要の可能性高し
    render json:{ post: post }
  end

  def checked
    post = Post.find(params[:id])
    if post.checked
      post.update(checked: false)
    else
      post.update(checked: true)
    end
    item = Post.find(params[:id])
    render json:{ post: item }
  end

end