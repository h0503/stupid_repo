class ArtistsController < ApplicationController
  # GET /artists
  # GET /artists.xml
  def index
    @artists = Artist.all
    @careers = Career.find(:all)
    @files = Dir.glob("public/images/artcat/a_001_001*")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @artists }
    end
  end

  # GET /artists/1
  # GET /artists/1.xml
  def show
    @artist = Artist.find(params[:id])
    @careers = Career.all
    @artpieces = @artist.artpieces
    @files = Dir.glob("public/images/artcat/artists/#{sprintf("%03d", @artist.id)}*")  
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @artist }
    end
  end

  # GET /artists/new
  # GET /artists/new.xml
  def new
    @artist = Artist.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @artist }
    end
  end

  # GET /artists/1/edit
  def edit
    @artist = Artist.find(params[:id])
  end

  # POST /artists
  # POST /artists.xml
  def create
    @artist = Artist.new(params[:artist])
    @career = Career.find(params[:artist][:career_id])
    @career.artists << @artist

    if @artist.save
    @image_name = "#{sprintf("%03d", @artist.id)}.jpg"
    @directory = "public/images/artcat/artists"
    # create the file path
    @path = File.join(@directory, @image_name)
    # write the file
    File.open(@path, "wb") { |f| f.write(params[:picture].read) }
    redirect_to(@artist, :notice => 'Artpiece was successfully created.')
    end
  end

  # PUT /artists/1
  # PUT /artists/1.xml
  def update
    @artist = Artist.find(params[:id])

    respond_to do |format|
      if @artist.update_attributes(params[:artist])
        format.html { redirect_to(@artist, :notice => 'Artist was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @artist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.xml
  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    respond_to do |format|
      format.html { redirect_to(artists_url) }
      format.xml  { head :ok }
    end
  end
end
