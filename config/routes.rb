class SubdomainConstraint
  def self.matches?(request)
    subdomains = %w{ www admin help faq }
    request.subdomain.present? && !subdomains.include?(request.subdomain)
  end
end


Rails.application.routes.draw do
 
  constraints SubdomainConstraint do
     resources :questions 
  end
  
  
  devise_for :users
  resources :users do
  resources :details
  end
  
  root to: 'visitors#index'
  
end


