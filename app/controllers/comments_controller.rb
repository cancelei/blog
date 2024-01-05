class CommentsController < ApplicationController
  def index
    # TODO: Implement index action
  end

  def show
    # TODO: Implement show action
  end

  def new
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = @blog_post.comments.build
  end

  def create
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = @blog_post.comments.build(comment_params)

    if @comment.save
      redirect_to blog_post_path(@blog_post), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def edit
    # TODO: Implement edit action
  end

  def update
    # TODO: Implement update action
  end

  def destroy
    # TODO: Implement destroy action
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
