require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryGirl.create(:user) }

  describe '登録' do

    context '有効なユーザ' do
      it 'うまく登録できること' do
        expect(user).to be_valid
      end
    end

    context '不正な:nameのため、登録できないこと' do
      # パスワードがかぶってることのテストがいるのかな
      it ':nameは短い' do
        user.name = "name"
        expect(user).to be_invalid
      end
      it ':nameは長い' do
        short_name = String.new
        41.times do
          short_name += "1"
        end
        user.name = short_name
        expect(user).to be_invalid
      end
    end

    context '不正な:passwordのため、登録できないこと' do
      it ':passwordは短い' do
        # encrypted_passwordもあるので新しいuserが作られた時に（つまり、FactoryGirl.create()を呼ぶ時）、
        # 不正なパスワードのテストをした方が？？
        user.password = "1"
        expect(user).to be_invalid
      end
      it ':passwordは長い' do
        long_password = String.new
        101.times do
          long_password += "1"
        end
        user.password = long_password
        expect(user).to be_invalid
      end
    end

    context '不正な:emailのため、登録できない' do
      it ':emailには「@」は入っていません' do
        user.email = "this_is_not_an_email_gmail.com"
        expect(user).to be_invalid
      end
    end
    
  end

end

