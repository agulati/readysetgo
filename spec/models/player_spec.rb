require "rails_helper"

RSpec.describe Player do
  include LintersHelper

  context "#{duration}" do
    it "returns the correct duration" do
      let!(:player) { Player.new }
      let!(:start)  { Time.now }
      let!(:finish) { start + 10 }

      allow(player).to receive(:start_time).and_return(start)
      allow(player).to receive(:finish_time).and_return(finish)

      expect(player.duration).to be 10
    end
  end
end

