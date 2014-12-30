module Preloadables
  class ApplicationController < ActionController::Base
    helper Preloadables::Engine.helpers
  end
end
