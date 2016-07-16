class PagesController < ApplicationController 
  include HighVoltage::StaticPage
  
 
 

  before_action :load_data

 
 

  private

  def load_data 
    
    case params[:id]
    when 'master_schedule'
      if policy(MasterSchedule).view? 
      @current_month = MasterSchedule.current_month 
      @upcoming_month = MasterSchedule.upcoming_month
      end
    when 'bulletin'
      @current_week = Bulletin.current_week 
      @previous_weeks = Bulletin.previous_weeks
     
    when 'FrequentlyAskedQuestions'
      faq_data
    when 'staff'
     @staff = Staff.all#pages_show
   when 'email'
    @site_setup_address = SiteSetup.address
    @service_times = ServiceTime.all
    when 'who_we_are'
     @site_setup_address = SiteSetup.address
     @service_times = ServiceTime.all
    when 'what_we_believe'  
     @summaries = Summary.all
    when 'what_to_expect'
     #layout_name
     when 'mission_method'
      #layout_name
   
    end
  end
  
  def faq_data
    
    
    if user_signed_in?
      
    @faqs = Faq.member
    
    if policy(Faq).admin? 
   
    @faqs = Faq.all
    end 
    
 
    
      
    
     else
    @faqs = Faq.everyone
    
     end
    
    
 
  end


  def layout_for_page
    
    layout_name = 'main_body_layout'
    
    case params[:id]
    when 'master_schedule'
      layout_name
    when 'bulletin'
      layout_name
    when 'FrequentlyAskedQuestions'
      layout_name
    when 'become_a_believer'
      layout_name
    when 'calendar'
      layout_name
    when 'staff'
      layout_name
    when 'facility'
      layout_name
    when 'email'
      'email'
    when 'privacy'
     layout_name
    when 'terms'
     layout_name
    when 'who_we_are'
     layout_name
    when 'what_we_believe'
     layout_name
    when 'what_to_expect'
     layout_name
     when 'mission_method'
      layout_name
    else 
      'application'
    end
  end
end
 
