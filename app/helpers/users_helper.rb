module UsersHelper

	def portrait(size)

	    # Twitter
	    # mini (24x24)                                                                  
	    # normal (48x48)                                            
	    # bigger (73x73)                                                
	    # original (variable width x variable height)

	    if self.image.include? "twimg"

	        # determine filetype        
	        case 
	        when self.image.downcase.include?(".jpeg")
	            filetype = ".jpeg"
	        when self.image.downcase.include?(".jpg")
	            filetype = ".jpg"
	        when self.image.downcase.include?(".gif")
	            filetype = ".gif"
	        when self.image.downcase.include?(".png")
	            filetype = ".png"
	        else
	            raise "Unable to read filetype of Twitter image for User ##{self.id}"
	        end

	        # return requested size
	        if size == "original"
	            return self.image
	        else
	            return self.image.gsub(filetype, "_#{size}#{filetype}")
	        end

	    end

	end

end
