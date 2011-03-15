class Home < ActiveRecord::Base

def self.search(search_item)
       if search_item
        self.where('section LIKE ?', "%#{search_item}%")    #Handles the ajax call.
       else
        self.all                                            #Handles the html call on startup.
       end
    end
    
    
end
