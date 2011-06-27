class ParsedsController < ApplicationController
  # GET /parseds
  # GET /parseds.xml
  def index
    @parseds = Parsed.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parseds }
    end
  end

  # GET /parseds/1
  # GET /parseds/1.xml
  def show
    @parsed = Parsed.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @parsed }
    end
  end

  # GET /parseds/new
  # GET /parseds/new.xml
  def new
    @parsed = Parsed.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @parsed }
    end
  end

  # GET /parseds/1/edit
  def edit
    @parsed = Parsed.find(params[:id])
  end

  # POST /parseds
  # POST /parseds.xml
  def create
    @parsed = Parsed.new(params[:parsed])

    respond_to do |format|
      if @parsed.save
        format.html { redirect_to(@parsed, :notice => 'Parsed was successfully created.') }
        format.xml  { render :xml => @parsed, :status => :created, :location => @parsed }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @parsed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parseds/1
  # PUT /parseds/1.xml
  def update
    @parsed = Parsed.find(params[:id])

    respond_to do |format|
      if @parsed.update_attributes(params[:parsed])
        format.html { redirect_to(@parsed, :notice => 'Parsed was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @parsed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parseds/1
  # DELETE /parseds/1.xml
  def destroy
    @parsed = Parsed.find(params[:id])
    @parsed.destroy

    respond_to do |format|
      format.html { redirect_to(parseds_url) }
      format.xml  { head :ok }
    end
  end
  def getupdate

	  end
end
