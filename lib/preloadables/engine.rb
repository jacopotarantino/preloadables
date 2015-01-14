module Preloadables
  class Engine < ::Rails::Engine

    # This ensures that Rails component based architecture apps
    # can use the helpers without having to manually require the
    # helpers.
    config.before_initialize do
      ActiveSupport.on_load :action_controller do
        helper Preloadables::Engine.helpers
      end
    end

  end
end
