
class DecksController < ApplicationController

include ActionView::Helpers::SanitizeHelper


  # GET /decks
  # GET /decks.xml
  def index
  #  This is the default
  #  @decks = Deck.all

  #  redefined for User control
    @decks = Deck.visible_by(current_user)
	
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

  
  # POST /decks
  # POST /decks.xml

  def create
	
	
	#for Paperclip
	@deck = Deck.create(params[:deck])
	@deck.viewcount = 0
	
	#for Devise
	if user_signed_in?
	@deck.user_id = current_user.id
	end
	
	#@deck = Deck.new(params[:deck])
	
    respond_to do |format|
      if @deck.save
        format.html { redirect_to root_path, :deck_id => @deck.id, 
		# This used to just say @deck, changed for ajax
		:notice => sanitize("Your deck can be viewed at <a href='#{root_url}in/#{@deck.random}'>#{root_url}in/#{@deck.random} </a>" ) }
		  
		#:notice => "Your deck can be viewed at http://slyde.it/in/#{@deck.random}" } 
		  
  		#This is part of the ajax call
		#format.js
		
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
