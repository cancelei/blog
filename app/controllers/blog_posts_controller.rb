class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
 # expect: [:index, :new, :create]
  def index
    puts @blog_posts.inspect
    if params[:search].present?
      puts @blog_posts.inspect
      @blog_posts = BlogPost.joins(:comments).where("blog_posts.title LIKE :search OR comments.body LIKE :search", search: "%#{params[:search]}%").distinct
    else
      @blog_posts = BlogPost.all
    end
  end

  def show
    @post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = current_user.blog_posts.new(blog_post_params)

    if @blog_post.save
      redirect_to @blog_post, notice: 'Blog post was successfully created.'
    else
      flash.now[:alert] = @blog_post.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
      sleep 0.22
      # - Sleep for better UX. This is a hack to simulate a slow server.
    else
    render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to blog_posts_path
  end

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
    redirect_to blog_posts_path, alert: "Blog post not found." if @blog_post.nil?
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end
end
