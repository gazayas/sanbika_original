require 'rails_helper'

RSpec.describe User, type: :model do
	
  describe '登録' do
  	context '有効なユーザ' do
  		it 'うまく登録できること' do
  			user = User.create(
  			name: "hello_my_name_is_gabe",
  			email: "example-email@email.com",
  			password: "hello_there")
  			expect(user).to be_valid
  		end
  	end
  end

end
