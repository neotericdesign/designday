require 'refinery'

module Refinery
  module Helpdocs
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "helpdocs"
          plugin.activity = {:class => Helpdoc}
        end
      end
    end
  end
end
