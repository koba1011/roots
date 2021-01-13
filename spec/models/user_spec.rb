require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー登録できる時' do
      it 'nameとuser_nam,email,password,password_confirmationが存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できない時' do
      it 'nameが空では登録できないこと' do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'user_nameが空では登録できないこと' do
        @user.user_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("User name can't be blank")
      end

      it 'user_nameは半角英数字以外では登録できないこと' do
        @user.user_name = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("User name Please type using half-width characters")
      end

      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'passwodが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = "aaaaa1"
        @user.password_confirmation = "bbbb1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
