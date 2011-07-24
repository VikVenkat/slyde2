
class DecksController < ApplicationController
  # GET /decks
  # GET /decks.xml
  def index
    @decks = Deck.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @decks }
    end
  end

  # GET /decks/1
  # GET /decks/1.xml
  def show
	
	if params[:random]
		then
		@deck = Deck.find_by_random(params[:random])
		else
		@deck = Deck.find(params[:id])
	end

	@deck.viewcount += 1
	@deck.save
	
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @deck }
    end
  end

  # GET /decks/new
  # GET /decks/new.xml
  def new
    @deck = Deck.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @deck }
    end
  end

  # GET /decks/1/edit
  def edit
    @deck = Deck.find(params[:id])
  end

  #We need these to clean spaces and randomize the URL (but then placed in model)
#  def randomize
#    @deck.random = rand(36**8).to_s(36)
	
#	until @deck.random 
  
  def cleanup_name
  	@deck.name = @deck.doc_file_name.gsub(' ', '_')
	@deck.doc_file_name = @deck.randomize
  end
  
  
  # POST /decks
  # POST /decks.xml

  def create
  #Amazon s3 Access
  #AWS::S3::Base.establish_connection!(
  #:access_key_id     => 'AKIAJETT5WWWOMFUITCQ',
  #:secret_access_key => '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'
  #)
	
	
	#for Paperclip
	@deck = Deck.create(params[:deck])
	@deck.viewcount = 0
	
	
	#@deck = Deck.new(params[:deck])
	
    respond_to do |format|
      if @deck.save
        format.html { redirect_to(@deck, :notice => 'Deck was successfully created.') }
        format.xml  { render :xml => @deck, :status => :created, :location => @deck }
      else
        format.html  { render :action => "new" }
        format.xml  { render :xml => @deck.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /decks/1
  # PUT /decks/1.xml
  def update
    @deck = Deck.find(params[:id])

    respond_to do |format|
      if @deck.update_attributes(params[:deck])
        format.html { redirect_to(@deck, :notice => 'Deck was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @deck.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /decks/1
  # DELETE /decks/1.xml
  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy

    respond_to do |format|
      format.html { redirect_to(decks_url) }
      format.xml  { head :ok }
    end
  end
end
