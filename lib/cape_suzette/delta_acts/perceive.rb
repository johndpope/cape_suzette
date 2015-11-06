module CapeSuzette
  module DeltaActs
    class DeltaPerceive < Base
      # Change own location to the location of the target
      @@planboxes = [
        CapeSuzette::Planboxes::PerceiveItemsAtLocation
      ]
      attr_accessor :agent, :target
      
      def initialize options
        super options

        # TODO Evaluate with respect to agent/environment
        # and pass into planbox instances any relevant data/
        # logic

        @agent = options[:agent]
        @target = options[:target]
      end

      goal_state Proc.new { |sigma| true }
    end
  end
end