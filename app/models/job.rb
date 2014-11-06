class Job < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end

  def self.search(search)
    if search
      #find(:all, :conditions => ['title LIKE ?', "#{search}"])
      where('title LIKE :search OR description LIKE :search', search: "%#{search}%")
    else
      self.all
    end
  end
end
