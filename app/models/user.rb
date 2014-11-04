class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
           has_many :jobs   

	  def subscribe_to_mailchimp(optin = false)
	    response = $mailchimp.lists.subscribe({
	       id: 'Angas Test',
	       email: {email: self.email},
	       merge_vars: { fname: self.name1, lname: self.name2 },
	       double_optin: optin,
	    })
	end

	def unsubscribe_from_mailchimp(notify = false)
	    response = $mailchimp.lists.unsubscribe({
	       id: 'Angas Test',
	       email: {email: self.email},
	       :delete_member => false, 
	       :send_notify => notify
	    })
	end


	private
    def subscribe_to_list
        Resque.enqueue(MailchimpSubscriber, self.id)
    end
  

  # has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/       

end
