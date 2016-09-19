require 'rails_helper'

RSpec.describe User, type: :model do

   let(:user) { FactoryGirl.create(:user) }

  	describe '登録' do
      context '有効なユーザ' do
        it 'うまく登録できること' do
          expect(user).to be_valid
        end
      end
    end

end
