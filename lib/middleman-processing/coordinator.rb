module Middleman
  module Processing
    class Coordinator

      def initialize(options, &block)
        instance_eval(&block) if block_given?
      end

      def process(a)
        #adds a process definition
      end

      def process_files(builder)
      end

    end
  end
end
