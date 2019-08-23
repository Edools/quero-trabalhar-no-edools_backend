class SubdomainConstraint
  def self.matches?(request)
    subdomains = %w{ www }
    request.subdomain.present? && !subdomains.include?(request.subdomain)
  end
end

Rails.application.routes.draw do
  get 'home/index'

  constraints SubdomainConstraint do
    resources :courses
    resources :student_courses
    resources :students
  end

  resources :schools
  root :to => "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
