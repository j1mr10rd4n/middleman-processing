require 'minitest/spec'
require 'minitest/autorun'
require 'rr'

class RRMockMinitestSpec < MiniTest::Spec
   include RR::Adapters::MiniTest
   #include RR::Adapters::RRMethods
   #include RR::Adapters::MiniTest
end

# include RR mocks in every description
MiniTest::Spec.register_spec_type(/.*/, RRMockMinitestSpec)
