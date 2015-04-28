class Collection < ActiveRecord::Base

has_many :helpful_links, :through => :collection_links
has_many :collection_links

end
