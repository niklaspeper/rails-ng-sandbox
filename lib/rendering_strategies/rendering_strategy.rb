# frozen_string_literal: true

# strategy pattern implementation (ruby on rails design pattern)
# + common interface (e.g. defining a NotImplementedError ensures that every subclass implements render method)
# + polymorphism (any subclass can implement render method and define different behaviour)
# + open/closed principle (new rendering strategies can be added without modifying existing code)
module RenderingStrategies
  module RenderingStrategy
    def render(article)
      raise NotImplementedError, 'Subclass must implement the render method.'
    end
  end
end
