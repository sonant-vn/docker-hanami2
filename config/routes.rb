# frozen_string_literal: true

module Htest
  class Routes < Hanami::Routes
    root { "Hello from Hanami (in a container)" }
  end
end
