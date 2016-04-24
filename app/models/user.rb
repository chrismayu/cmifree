class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  
  has_one :detail   
 
  after_create :set_detail, :create_tenant
  after_initialize :set_default_role, :if => :new_record?

 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         

   validates_presence_of :subdomain
   validates_format_of :subdomain, :with => /\A[A-Za-z0-9-]+\z/, :message => 'The subdomain can only contain alphanumeric characters and dashes.', :allow_blank => true
   validates_uniqueness_of :subdomain, :case_sensitive => false, :message => "  is already in use"
   validates_exclusion_of :subdomain, :in => %w( tester support blog www billing help api ), :message => "The subdomain <strong>{{value}}</strong> is reserved and unavailable."

   before_validation :downcase_subdomain
  

   def set_default_role
     self.role ||= :user
   end

 

    private

    def set_detail 
      build_detail
    end   


    def create_tenant
      #  Apartment::Tenant.create(subdomain)
    end    

      protected

    def downcase_subdomain
    #  self.subdomain.downcase! if attribute_present?("subdomain")
    end
end
