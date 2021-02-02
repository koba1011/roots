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
        expect(@user.errors.full_messages).to include("フルネームを入力してください")
      end

      it 'user_nameが空では登録できないこと' do
        @user.user_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ユーザーネームを入力してください")
      end

      it 'user_nameは半角英数字以外では登録できないこと' do
        @user.user_name = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("ユーザーネームは半角英数字で入力してください")
      end

      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end

      it 'passwodが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが英数(半角)を含めない場合は登録できないこと' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英字と数字の両方を含めて入力してください")
      end

      it 'passwordが半角数字だけでは登録できないこと' do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英字と数字の両方を含めて入力してください")
      end

      it 'passwordが全角でが登録できないこと' do
        @user.password = "ｔｅｓｔ１２"
        @user.password_confirmation = "ｔｅｓｔ１２"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英字と数字の両方を含めて入力してください")
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = "aaaaa1"
        @user.password_confirmation = "bbbb1"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end
