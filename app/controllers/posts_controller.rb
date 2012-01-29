class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index
    if params[:v] == Ptypes.find_by_name("comix").id.to_s
      @posts = Post.all(:conditions => {:ptype => params[:v].to_s})
    else
      @posts = Post.where("ptype NOT IN (2)")
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
    @images = PostImage.all(:conditions => {:entity_id => @post.id, :ptype => @post.ptype})
    @comment = Comment.new
    @ptype = @post.ptype

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    if params[:v] == Ptypes.find_by_name("comix").id.to_s
      @ptype = Ptypes.find_by_name("comix").id
    else
      @ptype = Ptypes.find_by_name("post").id
    end
    
    @post = Post.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    3.times {@post.post_images.build}
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.create(params[:post])

    respond_to do |format|
      if @post.save
        @image = PostImage.create(:photo => params[:post_image][:photo])
        @image[:ptype]     = @post.ptype.to_int
        @image[:entity_id] = @post.id
        @image.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
