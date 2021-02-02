require 'rails_helper'

RSpec.describe "コメント投稿", type: :system do
  before do
    @post = FactoryBot.create(:post)
    @comment = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーは投稿詳細ページでコメント投稿できる' do
    # ログインする
    sign_in(@post.user)

    # 投稿詳細ページに遷移する
    visit post_path(@post)

    # フォームに情報を入力する
    fill_in 'comment_text', with: @comment

    # コメントを送信すると、コメントが反映されることを確認する
    find('input[name="commit"]').click
    expect(page).to have_content @comment
  end
end
