require './base'

module CapeSuzette
  module Planbox
    class FooPlanbox < Base
      set_action "shit"

      validate :agent, { |x| x.class == Actor }
      
      precondition :agent, :is, :sentient
      precondition :agent, :is, :motile
    end
  end
end

a = CapeSuzette::Planbox::FooPlanbox.new
puts a.action
