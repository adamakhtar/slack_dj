require 'rails_helper'

RSpec.describe UserRota, :type => :model do
  it "advances to next turn" do
    team = create(:team)
    user_a = create(:user, team: team)
    user_b = create(:user, team: team)
    user_rota = UserRota.new(team)

    user_rota.advance_to_next_turn

    expect(team.users).to eq [user_b, user_a]
  end
end
