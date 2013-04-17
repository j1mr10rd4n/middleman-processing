require 'middleman-processing/coordinator'
require 'excel'

module Middleman
  module Processing

    class << self
      def registered(app, options_hash={}, &block)
        app.after_configuration do
          options_hash.merge!(:build_dir => build_dir, :images_dir => images_dir)
          @coordinator = Coordinator.new(options_hash, &block)
        end

        app.after_build do |builder|
          @coordinator.process_files(builder)
        end
      end
      alias :included :registered
    end

  end

end

