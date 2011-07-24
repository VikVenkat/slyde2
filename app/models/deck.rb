class Deck < ActiveRecord::Base
	# Look up how to do this. Initialize the value to zero instead of in model
	#before_initialize :init
	
	def init
		viewcount = 0
	end

	# Paperclip
  has_attached_file :doc,
					#:styles => { :thumb => ["100x100#", :png] },
					:url => "/in/:id/:basename.:extension",
					:path => ":rails_root/public/in/:id/:basename.:extension"
					
					

	
# The below was supposed to make scribd_fu work, but might be only rails 2, but works when scribd is local
  has_ipaper_and_uses 'Paperclip' 
end
