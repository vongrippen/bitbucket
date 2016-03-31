require 'spec_helper'

describe BitBucket::Team do
  let(:team) { BitBucket::Team.new }

  describe '.list' do
    before do
      expect(team).to receive(:request).with(
        :get,
        '/2.0/teams/?role=member',
        {},
        {}
      ).and_return({"values" => ['team1', 'team2', 'team3']})
    end

    context 'without a block' do
      it 'should send a GET request for the teams of which the user is a member' do
        team.list(:member)
      end
    end

    context 'with a block' do
      it 'should send a GET request for the teams of which the user is a member' do
        team.list(:member) { |team| team }
      end
    end
  end
end