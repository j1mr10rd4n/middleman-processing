require File.expand_path("../../spec_helper", __FILE__)
require 'middleman-processing/extension'

describe Middleman::Processing do

  describe '.registered' do
    let(:fake_mm) { mock }
    let(:builder) { Object.new }
    let(:mock_coordinator) { mock(Middleman::Processing::Coordinator) }

    before do
      stub(fake_mm).after_build.yields(builder)
    end

    describe 'with no options' do
      it 'invokes process_files on the coordinator passing the builder and an empty hash' do
        mock_coordinator.process_files(builder, {})
        Middleman::Processing.registered(fake_mm)
      end
    end

    describe 'with options' do
      let(:options) { { :name => 'value' } }
      it 'invokes process_files on the coordinator, passing the builder and the options hash' do
        mock_coordinator.process_files(builder, options)
        Middleman::Processing.registered(fake_mm, options)
      end
    end
  end
end

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
