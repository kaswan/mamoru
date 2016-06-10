class Admins::PostsController < Admins::ApplicationController
  before_action :set_users_post, only: [:show, :edit, :update, :destroy]
  before_action :set_pending_post, only: [:index, :attachment]
  # GET /users/posts
  # GET /users/posts.json
  def index
    @posts = current_admin_user.posts.active.page(params[:page] || 1).per(2)
  end

  # GET /users/posts/1
  # GET /users/posts/1.json
  def show
  end

  # GET /users/posts/new
  def new
    @post = Post.new
  end

  # GET /users/posts/1/edit
  def edit
  end

  # POST /users/posts
  # POST /users/posts.json
  def create
    @post = Post.new(users_post_params)
    @post.parent = current_admin_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/posts/1
  # PATCH/PUT /users/posts/1.json
  def update    
    respond_to do |format|
      if @post.update(users_post_params)
        format.html { redirect_to admins_posts_path, notice: 'Post was successfully updated.' }
        format.json { render :index, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/posts/1
  # DELETE /users/posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admins_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_post_params
      params.require(:post).permit(:post_type_id, :message, :parent_type, :parent_id, :pending_status,
      attachments_attributes: [:id, :upload, :parent_type, :parent_id, :relation_type, :relation_id])
    end
    
    def attachment_params
      params.require(:attachment).permit(:upload, :parent_type, :parent_id, :relation_type, :relation_id)
    end
    
    def set_pending_post
      current_admin_user.build_pending_post(:pending_status => true).save(validate: false) unless current_admin_user.pending_post
      @post = current_admin_user.pending_post
    end
    
end
