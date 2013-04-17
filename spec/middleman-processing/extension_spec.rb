require File.expand_path("../../spec_helper", __FILE__)
require 'middleman-processing/extension'

describe Middleman::Processing do

  describe '.registered' do
    let(:fake_mm) { mock }
    let(:build_dir) { "build" }
    let(:images_dir) { "images" }
    let(:builder) { Object.new }

    before do
      stub(Middleman::Processing).build_dir { build_dir }
      stub(Middleman::Processing).images_dir { images_dir }
      stub(fake_mm).after_configuration.yields
      stub(fake_mm).after_build.yields(builder)
    end

    describe 'in the after_configuration phase' do

      it 'configures a Coordinator, passing the options hash and given configuration block' do
        configuration_block = Proc.new{ 'processing config' }
        options_hash = { :key => 'value' }
        mock(Middleman::Processing::Coordinator).new(options_hash, &configuration_block).returns(stub!.process_files)
        Middleman::Processing.registered(fake_mm, options_hash, &configuration_block)
      end

      it 'adds the build_dir and images_dir to the options_hash before passing it to the Coordinator' do
        options_hash = { :key => 'value' }
        expected_options_hash = options_hash.merge(:build_dir => build_dir, :images_dir => images_dir)
        mock(Middleman::Processing::Coordinator).new(expected_options_hash).returns(stub!.process_files)
        Middleman::Processing.registered(fake_mm, options_hash)
      end
    end

    describe 'in the after_build phase' do
      let(:options_hash) { {} }
      let(:coordinator_mock) { mock!.process_files(builder).subject }

      before do
        mock(Middleman::Processing::Coordinator).new(options_hash, &Proc.new {}).returns(coordinator_mock)
      end

      it 'invokes process_files on the coordinator, passing the builder' do
        Middleman::Processing.registered(fake_mm, options_hash)
      end

    end

  end
end

