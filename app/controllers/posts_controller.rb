class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_forum_thread
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # POST /posts
  # POST /posts.json
  def create
    @post = @forum_thread.posts.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        @post.send_notifications!

        format.html { redirect_to @forum_thread, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to @forum_thread, alert: 'Post was invalid.' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_thread
      @forum_thread = ForumThread.find(params[:forum_thread_id])
    end

    def set_post
      @post = @forum_thread.posts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:thread_id, :user_id, :body)
    end
end
