Rails.application.routes.draw do

  mount Preloadables::Engine => "/preloadables"
end
