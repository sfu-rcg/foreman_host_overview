module ForemanHostOverview
  class Engine < ::Rails::Engine

    config.autoload_paths += Dir["#{config.root}/app/helpers/concerns"]

    initializer 'foreman_host_overview.register_plugin', :after=> :finisher_hook do |app|
      Foreman::Plugin.register :foreman_host_overview do
        requires_foreman '>= 1.6'
      end
    end

    config.to_prepare do
      begin
        # prepend only exists in Ruby 2.0.0+
        HostsHelper.send(:prepend, ForemanHostOverview::HostsHelperExtensions)
      rescue => e
        puts "ForemanHostOverview: skipping engine hook (#{e.to_s})"
      end
    end

  end
end
