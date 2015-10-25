class Article < ActiveRecord::Base
    has_many :comments
    has_many :taggings
    has_many :tags, through: :taggings
    
    def tag_list
        self.tags.collect do |tag|
            tag.name #creates an array of the article's tags; we want to show the actual text of the tag
        end.join(", ")
    end
    
    def tag_list=(tags_string)
        tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
        new_or_found_tags = tag_names.collect{ |name| Tag.find_or_create_by(name: name) } #find_or_create_by in this instance goes through each element in 'tag_names' and tries to find a match in the Tag collection.  If there's a match, it associates that found tag with the article; if not, it creates a new tag in Tag, and adds an association of the tag with the article. 
        self.tags = new_or_found_tags
    end
    
end
