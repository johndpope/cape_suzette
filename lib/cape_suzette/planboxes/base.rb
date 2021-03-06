module CapeSuzette
  module Planboxes
    class Base

      @@desc           = nil
      @@action         = nil
      @@preconditions  = []
      @@postconditions = []
      @@postaction     = nil
      @@validations    = []
      @@env_proc       = nil
      
      def initialize agent: nil,
                     delta: nil,
                     sigma: nil # TODO Make this &rest keyword args OR block? options?
        @sigma = sigma
        @delta = delta
        @agent = agent
      end

      def self.desc description
        @@desc = description
      end
      
      def self.action action
        @@action = action
      end

      # This proc gets run and is provided to the action.
      def self.env env_proc
        @@env_proc = env_proc
      end

      def self.precondition precondition
        # TODO Validate predicate, subject and object
        @@preconditions << precondition
      end

      def self.postcondition postcondition
        @@postconditions << postcondition
      end

      def self.postaction action
        @@postaction = action
      end
      
      def action
        @@action
      end

      def execute options
        # TODO Decide what you want your arguments to look like
        # and stick to it, damnit.
        evaluated_env = @@env_proc ? @@env_proc.call(options[:agent]) : nil
        
        if @@action.class == Proc
          @@action.call(@agent, @delta, @sigma, evaluated_env)
        else
          @@action.execute agent, delta, sigma, evaluated_env
        end
      end

      def preconditions
        @@preconditions
      end

      def postconditions
        @@postconditions
      end

      def postaction
        @@postaction
      end
    end
  end
end
