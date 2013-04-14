require "middleman-core"

require "middleman-processing/version"

::Middleman::Extensions.register(:processing) do
  require "middleman-processing/extension"
  ::Middleman::Processing
end
