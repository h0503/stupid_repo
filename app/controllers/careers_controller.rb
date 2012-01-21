class CareersController < ApplicationController
  def index
    @career = Career.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @careers }
    end
  end

  def show
    if params.include? :id
      @career = Career.find(:first, :conditions => ['id = ?', params[:id]])
    else
        redirect_to :action => 'index'
    end
  end

  def new
    @career = Career.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @careers }
    end
  end
  
  def create
    @career = Career.new(params[:career])

    respond_to do |format|
      if @career.save
        format.html { redirect_to(@career, :notice => 'career was successfully created.') }
        format.xml  { render :xml => @career, :status => :created, :location => @career }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @career.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @career = Career.find(params[:id])
    @career.destroy

    respond_to do |format|
      format.html { redirect_to(careers_url) }
      format.xml  { head :ok }
    end
  end
end
