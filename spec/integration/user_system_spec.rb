require 'rails_helper'
require 'carrierwave/test/matchers'

feature 'Sign up, edit and delete a user' do
  include CarrierWave::Test::Matchers

  scenario 'Sign up a user' do
    visit new_user_registration_path
    fill_in 'メール', with: 'g-zayas@hotmail.com'
    fill_in 'Username', with: 'gazayas'
    fill_in 'パスワード', with: 'Password'
    fill_in 'パスワード確認', with: 'Password'
    click_on 'Sign up'

    expect(page).to have_content('ようこそ！アカウント登録を受け付けました。確認のメールをお送りします。')
  end

  let(:user) { FactoryBot.create(:user) }

  scenario 'Edit user name' do
    login_as user
    visit user_path(id: user)
    click_on 'プロファイルの編集'
    fill_in 'user_username', with: 'new_username'
    click_on '保存'

    expect(page).to have_content('プロファイルが更新されました')
    expect(page).to have_content('new_usernameさんの賛美歌チャート')
  end

  scenario 'Edit user picture' do
    # TODO: Set up the code to change the picture
  end

  let(:user) { FactoryBot.create(:user) }
  scenario 'Delete user', js: true do
    login_as user
    visit user_path(id: user)
    click_on 'アカウントの削除'
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content('ユーザは削除されました')
    expect(User.first(user.id)).to be_empty
  end
end
