require 'rails_helper'

RSpec.describe Song, type: :model do

  subject { song }
  let(:user) { FactoryGirl.create(:user) }
  
  describe '登録' do
    context '有効のパラメーター' do
      let(:song) { FactoryGirl.create(:song, user: user) }
      it { is_expected.to be_valid }
    end
  end

end
