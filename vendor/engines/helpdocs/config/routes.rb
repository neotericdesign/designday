Refinery::Application.routes.draw do
  resources :helpdocs, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :helpdocs, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
