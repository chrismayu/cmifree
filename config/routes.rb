class SubdomainConstraint
  def self.matches?(request)
    subdomains = %w{ www admin help faq }
    request.subdomain.present? && !subdomains.include?(request.subdomain)
  end
end


Rails.application.routes.draw do
 
  
  constraints SubdomainConstraint do
     resources :questions 
     resources :event_submissions
  end
  
  
  devise_for :users, controllers: {registrations: "registrations" }
  resources :users do
  resources :details
  end
  authenticated :user do
     root 'details#show', as: :authenticated_root
  end
  get "visitors/thank_you"
  root to: 'visitors#index'
  
  
end


