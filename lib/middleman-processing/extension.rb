require 'middleman-processing/coordinator'

module Middleman
  module Processing
    class << self
      def registered(app, options={})
        app.after_build do |builder|
          Coordinator.process_files(builder, options)
        end
      end
      alias :included :registered
    end
  end
end

