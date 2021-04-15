require 'rails_helper'
require 'carrierwave/test/matchers'

RSpec.describe User, type: :model do
  include CarrierWave::Test::Matchers


  #TODO: There are still some attributes in this model that should be tested/resolved
  subject { user }

  describe 'associations' do
    let(:user) { FactoryBot.create(:user) }
    it { is_expected.to have_many(:songs) }
    it { is_expected.to have_many(:set_lists) }
    it { is_expected.to have_many(:set_list_songs).through(:set_lists) }
    it { is_expected.to have_many(:favorites).through(:songs) }
  end

  describe 'valid parameters' do
    let(:user) { FactoryBot.create(:user) }

    context 'the factory produces a valid user' do
      it { is_expected.to be_valid }
    end
  end

  describe 'invalid parameters' do
    describe 'username' do
      let(:user) { FactoryBot.build(:user, username: username) }

      context 'is too short' do
        let(:username) { 'foo' }
        it { is_expected.to be_invalid }
      end

      context 'is too long' do
        let(:username) { 'a' * 31 }
        it { is_expected.to be_invalid }
      end
    end

    # Length is defined by config.password_length in the devise initializer
    describe 'password' do
      let(:user) { FactoryBot.build(:user, password: password) }

      context 'is too short' do
        let(:password) { "123" }
        it { is_expected.to be_invalid }
      end

      context 'is too long' do
        let(:password) { "A" * 129 }
        it { is_expected.to be_invalid }
      end
    end

    describe 'email' do
      let(:user) { FactoryBot.build(:user, email: email) }

      context 'is invalid if there is no @' do
        let(:email) { "not_valid.com" }
        it { is_expected.to be_invalid }
      end
    end

    # TODO: Put this in the valid parameters block at the top
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

      it 'uses the correct format' do
        expect(uploader).to be_format('jpeg')
      end
    end
  end
end
