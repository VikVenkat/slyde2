class Deck < ActiveRecord::Base
	# Look up how to do this. Initialize the value to zero instead of in model
	# before_initialize :init
	
	#From some online article, didnt work
	#acts_as_scribd_document
	
# Paperclip
  has_attached_file :doc,
					#:styles => { :thumb => ["100x100#", :png] },
					:url => "/in/:id/:basename.:extension",
					:path => ":rails_root/public/in/:id/:basename.:extension"
					
					

	#def init
	#	viewcount = 0
	#end
	
# The below was supposed to make scribd_fu work, but might be only rails 2
  has_ipaper_and_uses 'Paperclip' 
end
