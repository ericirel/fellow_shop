class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :job

  def self.search(search)
    if search
      #find(:all, :conditions => ['title LIKE ?', "#{search}"])
      where('name LIKE :search OR description LIKE :search', search: "%#{search}%")
    else
      self.all
    end
  end
end
