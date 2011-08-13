class Deck < ActiveRecord::Base
	# Look up how to do this. Initialize the value to zero instead of in model
	#before_initialize :init
	
  validates_presence_of :random
  validates_uniqueness_of :random

  before_save :clean_filename
  
  belongs_to :user
	
	def init
		viewcount = 0
	end
	
	# Devise
	def self.visible_by(user)
	  if user.is_admin
		Deck.all
	  else
	    Deck.where :user_id => user.id
	  end
	end

	# Paperclip
  has_attached_file :doc,
					#:styles => { :thumb => ["100x100#", :png] },
					#Previous URL format before trying random
					#:url => "/in/:id/:basename.:extension",
					:url => "/in/:id/:random",
					:path => ":rails_root/public/in/:id/:basename.:extension",
					:storage => :s3,
					:bucket => 'Slyde',
					:s3_credentials => {
					  :access_key_id     => 'AKIAJETT5WWWOMFUITCQ',
					  :secret_access_key => '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'
					}
					
  #Amazon s3 Access
  #AWS::S3::Base.establish_connection!(
  #:access_key_id     => 'AKIAJETT5WWWOMFUITCQ',
  #:secret_access_key => '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'
  #)


	
# The below was supposed to make scribd_fu work, but might be only rails 2, but works when scribd is local
  has_ipaper_and_uses 'Paperclip' 
  

#  To create a unique ID
  protected
  def before_validation
    self.random = rand(36**8).to_s(36) if self.new_record? and self.random.nil?
  end 
  #note: Rails has this built in SecureRandom.hex(4) => makes an 8 digit random hex

  def clean_filename
     doc_file_name.gsub!(' ', '_')
  end
  
end
