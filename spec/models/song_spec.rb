require 'rails_helper'

RSpec.describe Song, type: :model do

  subject { song }
  let(:user) { FactoryBot.create(:user) }
  let(:song) { FactoryBot.create(:song, user: user) }

  describe '他モデルとの関連' do
    it { is_expected.to belong_to(:user) }
  end

  describe '有効のパラメーター' do
    it 'ユーザと一致すること' do
      expect(song.user_id).to eq user.id
    end

    it { is_expected.to be_valid }
  end

  describe '無効のパラメーター' do
    describe 'title' do
      let(:song) { FactoryBot.build(:song, user: user, title: title) }

      context '書いてない場合' do # これをshared_contextにする？
        let(:title) { '' }
        it { is_expected.to be_invalid }
      end

      context '長すぎている場合' do
        let(:title) { 'a' * 51 }
        it { is_expected.to be_invalid }
      end
    end

    describe 'artist' do
      let(:song) { FactoryBot.build(:song, user: user, artist: artist) }

      context '書いてなくても大丈夫' do
        let(:artist) { '' }
        it { is_expected.to be_valid }
      end

      context '長すぎている場合' do
        let(:artist) { 'a' * 51 }
        it { is_expected.to be_invalid }
      end
    end

    # <select>で決まるからこのテストはあんまりいらないけど、念のために書いています。
    describe 'key' do
      let(:song) { FactoryBot.build(:song, user: user, key: key) }

      context 'ない場合' do
        let(:key) { '' }
        it { is_expected.to be_invalid }
      end

      context '長すぎている場合' do
        let(:key) { 'C#m' }
        it { is_expected.to be_invalid }
      end
    end
  end

  describe 'song_body' do
    let(:song) { FactoryBot.build(:song, user: user, song_body: song_body) }

    context '書いてない場合' do
      let(:song_body) { '' }
      it { is_expected.to be_invalid }
    end

    context '長すぎている場合' do
      let(:song_body) { 'a' * 7_000_001 }
      it { is_expected.to be_invalid }
    end
  end

  describe 'video' do
    let(:song) { FactoryBot.build(:song, user: user, video: video) }

    context 'httpで正しい形式' do
      let(:video) { 'http://youtu.be/itdgtFALCpo' }
      it { is_expected.to be_valid }
    end

    context 'httpsで正しい形式' do
      let(:video) { 'https://youtu.be/itdgtFALCpo' }
      it { is_expected.to be_valid }
    end

    context '普通のyoutubeのリンクで正しい形式' do
      let(:video) { 'https://www.youtube.com/watch?v=itdgtFALCpo&feature=youtu.be' }
      it { is_expected.to be_valid }
    end

    context '正しくない形式' do
      let(:video) { 'https://google.com/' }
      it { is_expected.to be_invalid }
    end
  end
end
