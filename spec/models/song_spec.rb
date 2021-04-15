require 'rails_helper'

RSpec.describe Song, type: :model do

  subject { song }
  let(:user) { FactoryBot.create(:user) }
  let(:song) { FactoryBot.create(:song, user: user) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'valid parameters' do
    context 'has a title' do
      let(:title) { 'タイトル' }
      it { is_expected.to be_valid }
    end

    context 'has a key' do
      let(:title) { 'C' }
      it { is_expected.to be_valid }
    end

    context 'has lyrics' do
      let(:lyrics) { '歌詞' }
      it { is_expected.to be_valid }
    end

    describe 'video' do
      let(:song) { FactoryBot.build(:song, user: user, video: video) }

      context 'has the proper http format' do
        let(:video) { 'http://youtu.be/itdgtFALCpo' }
        it { is_expected.to be_valid }
      end

      context 'has the proper https format' do
        let(:video) { 'https://youtu.be/itdgtFALCpo' }
        it { is_expected.to be_valid }
      end

      context 'has a valid link that is' do
        let(:video) { 'https://www.youtube.com/watch?v=itdgtFALCpo&feature=youtu.be' }
        it { is_expected.to be_valid }
      end

      context 'has a valid link with a continue attribute' do
        let(:video) { 'https://www.youtube.com/watch?time_continue=1&v=6OHEAbjBtlY' }
        it { is_expected.to be_valid }
      end
    end
  end

  describe 'invalid parameters' do
    describe 'title' do
      let(:song) { FactoryBot.build(:song, user: user, title: title) }

      context 'is not present' do
        let(:title) { '' }
        it { is_expected.to be_invalid }
      end

      context 'is too long' do
        let(:title) { 'a' * 51 }
        it { is_expected.to be_invalid }
      end
    end

    describe 'key' do
      let(:song) { FactoryBot.build(:song, user: user, key: key) }

      context 'has no key' do
        let(:key) { '' }
        it { is_expected.to be_invalid }
      end

      context 'has a key that is too long' do
        let(:key) { 'C#m' }
        it { is_expected.to be_invalid }
      end
    end
  end

  describe 'song_body' do
    let(:song) { FactoryBot.build(:song, user: user, song_body: song_body) }

    context 'has no lyrics' do
      let(:song_body) { '' }
      it { is_expected.to be_invalid }
    end

    context 'has too many lyrics' do
      let(:song_body) { 'a' * 7_000_001 }
      it { is_expected.to be_invalid }
    end
  end

  describe 'video' do
    let(:song) { FactoryBot.build(:song, user: user, video: 'https://google.com/') }
    context 'has an invalid format' do
      it { is_expected.to be_invalid }
    end
  end
end
