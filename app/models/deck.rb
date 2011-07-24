class Deck < ActiveRecord::Base
	# Look up how to do this. Initialize the value to zero instead of in model
	#before_initialize :init
	
  validates_presence_of :random
  validates_uniqueness_of :random


	
	def init
		viewcount = 0
	end

	# Paperclip
  has_attached_file :doc,
					#:styles => { :thumb => ["100x100#", :png] },
					#Previous URL format before trying random
					#:url => "/in/:id/:basename.:extension",
					:url => "/in/:id/:random",
					:path => ":rails_root/public/in/:id/:basename.:extension"
					
					

	
# The below was supposed to make scribd_fu work, but might be only rails 2, but works when scribd is local
  has_ipaper_and_uses 'Paperclip' 
  

#  To create a unique ID
  protected
  def before_validation
    self.random = rand(36**8).to_s(36) if self.new_record? and self.random.nil?
  end 

end
