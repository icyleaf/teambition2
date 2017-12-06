module Teambition2
  class Error < StandardError; end

  class ParamError < Error; end

  class NoPermissionError < Error; end
end
