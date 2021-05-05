require 'rails_helper'

feature 'Create, use, edit and delete a song' do
  let(:user) { FactoryBot.create(:user) }

  scenario 'create a new song' do
    login_as user
    visit user_path(id: user)
    click_on '新規チャート'
    fill_in 'song_title', with: '歌のタイトル'
    fill_in 'song_song_body', with: '歌の歌詞'
    click_on '保存'
    expect(page).to have_content('讃美歌チャートは作成されました')
  end

  scenario 'edit a song' do
    login_as user
    visit user_path(id: user)
    click_on '新規チャート'
    fill_in 'song_title', with: '歌のタイトル'
    fill_in 'song_song_body', with: '歌の歌詞'
    click_on '保存'

    visit user_song_path(id: user.songs.first, user_id: user.id)
    click_on '編集'
    fill_in 'song_song_body', with: '新しい歌詞'
    click_on '保存'

    expect(page).to have_content('讃美歌チャートは更新されました')
    expect(page).to have_content('新しい歌詞')
  end

  scenario 'confirm chords are wrapped in a .chord span tag', js: true do
    login_as user
    visit user_path(id: user)
    click_on '新規チャート'
    fill_in 'song_title', with: '歌のタイトル'
    select 'G', from: 'song_key'
    fill_in 'song_song_body',
      with: "G     C     D\n" +
            "歌詞"
    click_on '保存'

    expect(all('.chord')[0].text).to eq('G')
    expect(all('.chord')[1].text).to eq('C')
    expect(all('.chord')[2].text).to eq('D')
  end

  scenario 'changing the key of the song performs a key change', js: true do
    login_as user
    visit user_path(id: user)
    click_on '新規チャート'
    fill_in 'song_title', with: '歌のタイトル'
    select 'G', from: 'song_key'
    fill_in 'song_song_body',
      with: "G     C     D\n" +
            "歌詞"
    click_on '保存'

    select 'A', from: 'key_box'
    expect(all('.chord')[0].text).to eq('A')
    expect(all('.chord')[1].text).to eq('D')
    expect(all('.chord')[2].text).to eq('E')
  end

  let(:user_with_song) { FactoryBot.create(:user_with_song) }
  scenario 'delete the song', js: true do
    login_as user
    visit user_path(id: user)
    click_on '新規チャート'
    fill_in 'song_title', with: '歌のタイトル'
    fill_in 'song_song_body', with: '歌の歌詞'
    click_on '保存'

    visit user_song_path(id: user.songs.first, user_id: user)
    click_on '削除'
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('讃美歌チャートは削除されました')
  end
end
