require 'rails_helper'

RSpec.describe User, type: :model do

  subject { user }

  describe '有効なユーザ' do
    let(:user) { FactoryGirl.create(:user) }

    context 'UserのFactoryをそのまま作成する場合' do
      it { is_expected.to be_valid }
    end
  end

  describe '無効のパラメーター' do

    describe '.name' do
      let(:user) { FactoryGirl.build(:user, name: name) }

      context '.nameは短い' do
        let(:name) { "name" }
        it { is_expected.to be_invalid }
      end

      context '.nameは長い' do
        let(:name) { "a" * 41 }
        it { is_expected.to be_invalid }
      end
    end

    describe '.password' do
      let(:user) { FactoryGirl.build(:user, password: password) }

      context '.passwordは短い' do
        let(:password) { "pass" }
        it { is_expected.to be_invalid }
      end

      context '.passwordは長い' do
        let(:password) { "A" * 101 }
        it { is_expected.to be_invalid }
      end
    end

    describe '.email' do
      let(:user) { FactoryGirl.build(:user, email: email) }

      context '「＠」は抜いている場合' do
        let(:email) { "not_valid.com" }
        it { is_expected.to be_invalid }
      end
    end

  end # '無効のパラメーター'の終わり'

end
