require 'rails_helper'

feature 'Create, edit, delete Set Lists' do
  let(:user) { FactoryBot.create(:user_with_populated_set_lists) }
  let(:user_friend) { FactoryBot.create(:user_with_populated_set_lists) }

  scenario 'Create a new Set List and add songs to it' do
    login_as user
    visit user_path(id: user)
    click_on '新しいセットリスト'
    fill_in 'set_list_title', with: 'Set List Title'
    click_on '保存'
    expect(page).to have_content('セットリストは作成されました')

    visit user_song_path(id: user.songs.first, user_id: user)
    click_on 'Add to Set List'
    expect(page).to have_content("「#{user.songs.first.title}」を好きなセットリストに追加してください。")
    click_on 'Set List Title'
    expect(page).to have_content('曲がセットリストに追加されました')
  end

  scenario 'Add a song with a different key', js: true do
    login_as user
    visit user_song_path(id: user_friend.songs.first, user_id: user_friend)

    # The keys are randomized in FactoryBot,
    # So we just make sure it really is a different key
    new_key = user_friend.songs.first.key == 'A' ? 'C' : 'A'
    select new_key, from: 'key_box'
    click_on 'Add to Set List'
    expect(page).to have_content("歌はこのキーで追加されます：#{new_key}")

    click_on "#{user.set_lists.first.title}"
    expect(page).to have_content('曲がセットリストに追加されました')
    expect(all('.chord').last.text).to eq(new_key)
    expect(page).to have_content("#{new_key}\n歌詞")
  end

  # TODO
  # scenario 'save a new key and confirm the song body is displayed properly' do
  # end

  # TODO: Test the drag and drop function in edit_user_set_list_path(...)

  scenario 'Delete a Set List', js: true do
    login_as user
    visit user_set_list_path(id: user.set_lists.first, user_id: user)
    click_on '削除'
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('セットリストは削除されました')
  end
end
