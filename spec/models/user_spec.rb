require 'rails_helper'
require 'carrierwave/test/matchers'

RSpec.describe User, type: :model do
  include CarrierWave::Test::Matchers

  subject { user }

  describe '他モデルとの関連' do
    let(:user) { FactoryBot.create(:user) }
    it { is_expected.to have_many(:songs) }
  end

  describe '有効のパラメーター' do
    let(:user) { FactoryBot.create(:user) }

    context 'UserのFactoryをそのまま作成する場合' do
      it { is_expected.to be_valid }
    end
  end

  describe '無効のパラメーター' do
    describe 'name' do
      let(:user) { FactoryBot.build(:user, name: name) }

      context 'nameは短い' do
        let(:name) { "name" }
        it { is_expected.to be_invalid }
      end

      context 'nameは長い' do
        let(:name) { "a" * 41 }
        it { is_expected.to be_invalid }
      end
    end

    describe 'password' do
      let(:user) { FactoryBot.build(:user, password: password) }

      context 'passwordは短い' do
        let(:password) { "pass" }
        it { is_expected.to be_invalid }
      end

      context 'passwordは長い' do
        let(:password) { "A" * 101 }
        it { is_expected.to be_invalid }
      end
    end

    describe 'email' do
      let(:user) { FactoryBot.build(:user, email: email) }

      context '「＠」は抜いている場合' do
        let(:email) { "not_valid.com" }
        it { is_expected.to be_invalid }
      end
    end

    describe 'user_image' do
      let(:user) { FactoryBot.build(:user) }
      let(:uploader) { UserImageUploader.new(user, :avatar) }

      before do
        UserImageUploader.enable_processing = true
        File.open(File.join(Rails.root, 'spec', 'support', '奈良.jpeg')) { |f| uploader.store!(f) }
      end

      after do
        UserImageUploader.enable_processing = false
        uploader.remove!
      end

      it "形式が正しいこと" do
        expect(uploader).to be_format('jpeg')
      end

      # 次のテストを実装したい
      # the small versionはページに表示されて、resizeと違う
      # 例えばページの画像をクリックしたら、本当の(resizeされた)大きさを表示する
      #
      # thumbnailも要るかもしれない
      # チャートの一覧の左側にthumbnailを表示できたらいいかな
      # それはまた後で

      # context 'the thumb version' do
      #  it "scales down a landscape image to be exactly 64 by 64 pixels" do
      #    expect(uploader.thumb).to have_dimensions(64, 64)
      #  end
      # end

      # context 'the small version' do
      #   it "scales down a landscape image to fit within 200 by 200 pixels" do
      #     expect(uploader.small).to be_no_larger_than(200, 200)
      #   end
      # end

      # it "makes the image readable only to the owner and not executable" do
      #   expect(uploader).to have_permissions(0600)
      # end
    end
  end
end
