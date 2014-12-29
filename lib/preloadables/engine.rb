module Preloadables
  class Engine < ::Rails::Engine
    isolate_namespace Preloadables

    initializer 'preloadables_engine.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper Preloadables::ApplicationHelper
      end
    end
  end
end
