class SubdomainConstraint
  def self.matches?(request)
    subdomains = %w{ www admin help faq }
    request.subdomain.present? && !subdomains.include?(request.subdomain)
  end
end


Rails.application.routes.draw do
 
  
  resources :faqs
  constraints SubdomainConstraint do
     
     resources :event_submissions
  end
  authenticated :user do
     root 'users#show', as: :authenticated_root
      get "users/all_CSV"
  end
  
  resources :questions 
  get "users/stats"
  devise_for :users, controllers: {registrations: "registrations" }
  resources :users do
  resources :details
  end

  get "visitors/thank_you"
  root to: 'visitors#index'
  match 'contact' => 'contact#new',  :via => :get
  match 'contact' => 'contact#create', :via => :post
  resources :pages, :path => ''  # to prevent high_voltage for doing ...com/pages/about
  match '*path', to: redirect('/'), via: :all
   
end


