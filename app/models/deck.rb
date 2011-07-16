class Deck < ActiveRecord::Base
	# Look up how to do this. Initialize the value to zero instead of in model
	# before_initialize :init
	
# Paperclip
  has_attached_file :doc,
					#:styles => { :thumb => ["100x100#", :png] },
					:url => "/in/:id/:basename.:extension",
					:path => ":rails_root/public/in/:id/:basename.:extension"
					
					

	#def init
	#	viewcount = 0
	#end
end
