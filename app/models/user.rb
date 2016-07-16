class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  
  has_one :detail   
 
  after_create :set_detail, :create_tenant
  after_initialize :set_default_role, :if => :new_record?

 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         

   validates_presence_of :subdomain, :first_name, :last_name
   validates_format_of :subdomain, :with => /\A[A-Za-z0-9-]+\z/, :message => 'The subdomain can only contain alphanumeric characters and dashes.', :allow_blank => true
   validates_uniqueness_of :subdomain, :case_sensitive => false, :message => "  is already in use"
   validates_exclusion_of :subdomain, :in => %w( tester support blog www billing help api ), :message => "The subdomain <strong>{{value}}</strong> is reserved and unavailable."

   before_validation :downcase_subdomain
   scope :submission, -> { select( :id) }
   scope :email, -> { select( :email) }
   scope :display_name, -> { select( :first_name, :last_name) } 
   scope :church, -> { select( :church_name) }  
   scope :how_did_they_hear, -> { select( :how_did_you_hear , :how_did_you_hear_other) }  
 

   def set_default_role
     self.role ||= :user
   end

   def self.get_name
     tenant_name = Apartment::Tenant.current
     detail = User.display_name.where(:subdomain => tenant_name)
     final_name = "#{detail.first_name.titleize} #{detail.last_name.titleize}"
   end
   
   def self.get_tenant_user_email
     tenant_name = Apartment::Tenant.current
     detail = User.email.where(:subdomain => tenant_name)
   end
 

   def self.get_tenant_user
     tenant_name = Apartment::Tenant.current
     detail = User.submission.where(:subdomain => tenant_name)
   end
 

    private

    def set_detail 
      build_detail
    end   


    def create_tenant
       Apartment::Tenant.create(subdomain)
    end    

      protected

    def downcase_subdomain
      self.subdomain.downcase! if attribute_present?("subdomain")
    end
end
