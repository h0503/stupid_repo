class ArtpiecesController < ApplicationController
  # GET /artpieces
  # GET /artpieces.xml
  def index
    @artpieces = Artpiece.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @artpieces }
    end
  end

  # GET /artpieces/1
  # GET /artpieces/1.xml
  def show
    @artpiece = Artpiece.find(params[:id])
    @author = Artist.find(@artpiece[:artist_id])
    @files = Dir.glob("public/images/artcat/p_00#{@author.id}_00#{@artpiece.id}*")
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @artpiece }
    end
  end

  # GET /artpieces/new
  # GET /artpieces/new.xml
  def new
    @artpiece = Artpiece.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @artpiece }
    end
  end

  # GET /artpieces/1/edit
  def edit
    @artpiece = Artpiece.find(params[:id])
  end

  # POST /artpieces
  # POST /artpieces.xml
  def create
    @artpiece = Artpiece.new(params[:artpiece])
    @artist = Artist.find(params[:artpiece][:artist_id])
    @artist.artpieces << @artpiece

    if @artpiece.save
      @image_name = "art_#{@artpiece.id}_#{@artpiece.artist_id}"
      @directory = "public/data"
      # create the file path
      @path = File.join(@directory, @image_name)
      # write the file
      File.open(@path, "wb") { |f| f.write(params[:picture].read) }
      redirect_to(@artist, :notice => 'Artpiece was successfully created.')
    end
  end

  # PUT /artpieces/1
  # PUT /artpieces/1.xml
  def update
    @artpiece = Artpiece.find(params[:id])

    respond_to do |format|
      if @artpiece.update_attributes(params[:artpiece])
        format.html { redirect_to(@artpiece, :notice => 'Artpiece was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @artpiece.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /artpieces/1
  # DELETE /artpieces/1.xml
  def destroy
    @artpiece = Artpiece.find(params[:id])
    @artpiece.destroy

    respond_to do |format|
      format.html { redirect_to(artists_url) }
      format.xml  { head :ok }
    end
  end
end
