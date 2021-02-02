require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ログインに成功し、トップページに遷移する' do
    # ログインする
    sign_in(@user)
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # ログインページに遷移する
    visit new_user_session_path

    # 誤ったユーザー情報を入力する
    fill_in 'email', with: "test"
    fill_in 'password', with: "test"

    # ログインボタンをクリックする 
    find('input[name="commit"]').click

    # ログインページに戻ってきていることを確認する
    expect(current_path).to eq new_user_session_path
  end
end
