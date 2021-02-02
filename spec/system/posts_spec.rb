require 'rails_helper'

RSpec.describe "投稿機能", type: :system do
  before do
    @post = FactoryBot.create(:post)
  end

  context '投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる(動画投稿)' do
      # ログインする
      sign_in(@post.user)

      # 投稿ページに遷移する 
      visit new_post_path

      # 添付する動画を定義する
      video_path = Rails.root.join('public/videos/test.mp4')

      # 動画選択フォームに動画を添付する
      attach_file('post[video]', video_path, make_visible: true)
      
      # フォームに情報を入力する
      fill_in 'post-caption', with: @post.caption

      # 送信するとPostモデルのカウントが1上がることを確認する
      expect {
        find('input[name="commit"]').click
      }.to change { Post.count }.by(1)

      # 投稿に成功するとトップページに遷移することを確認する
      expect(current_path).to eq root_path

      # トップページに投稿した内容のcaptionが存在することを確認する
      expect(page).to have_content(@post.caption)

      # トップページに投稿した内容のvideoが存在することを確認する
      expect(page).to have_selector("video")
    end

    it 'ログインしたユーザーは新規投稿できる(Youtube動画の共有)' do
      # ログインする
      sign_in(@post.user)

      # 投稿ページに遷移する
      visit new_post_path

      # フォームに情報を入力する
      fill_in 'post-youtube_url', with: "https://www.youtube.com/watch?v=7NVEpjR9xak"
      fill_in 'post-caption', with: @post.caption

      # 送信するとPostモデルのカウントが1上がることを確認する
      expect {
        find('input[name="commit"]').click
      }.to change { Post.count }.by(1)

      # 投稿に成功するとトップページに遷移することを確認する
      expect(current_path).to eq root_path

      # トップページに投稿した内容のcaptionが存在することを確認する
      expect(page).to have_content(@post.caption)

      # トップページに投稿したyoutube_urlの画像が存在することを確認する
      expect(page).to have_selector("img")
    end
  end

  context '投稿ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できずログインページに移動する' do
      # 新規投稿ページに遷移する
      visit new_post_path

      # ログインしていない場合、ログインページに遷移していることを確認する
      expect(current_path).to eq new_user_session_path
    end

    it 'ログインしても送る値が空の場合、投稿に失敗すること' do
      # ログインする
      sign_in(@post.user)

      # 投稿ページに遷移する
      visit new_post_path

      # DBに保存されていないことを確認する
      expect {
        find('input[name="commit"]').click
      }.not_to change { Post.count }

      # 投稿ページに戻ることを確認する
      expect(current_path).to eq posts_path
    end

    it '動画とyoutubeのURL両方を選択すると、投稿に失敗すること' do
      # ログインする
      sign_in(@post.user)

      # 投稿ページに遷移する
      visit new_post_path

      # 添付する動画を定義する
      video_path = Rails.root.join('public/videos/test.mp4')

      # 動画選択フォームに動画を添付する
      attach_file('post[video]', video_path, make_visible: true)
      
      # フォームに情報を入力する
      fill_in 'post-youtube_url', with: "https://www.youtube.com/watch?v=7NVEpjR9xak"
      fill_in 'post-caption', with: @post.caption

      # DBに保存されていないことを確認する
      expect {
        find('input[name="commit"]').click
      }.not_to change { Post.count }

      # 投稿ページに戻ることを確認する
      expect(current_path).to eq posts_path
    end
  end
end

RSpec.describe '投稿詳細機能', type: :system do
  before do
    @post = FactoryBot.create(:post)
  end

  it 'ログインしたユーザーは投稿詳細ページに遷移でき、各情報が確認できる'do
    # ログインする
    sign_in(@post.user)

    # 詳細ページに遷移する
    visit post_path(@post)

    # 詳細ページに投稿の内容が含まれている
    expect(page).to have_selector("video")
    expect(page).to have_content("#{@post.caption}")

    # コメント用のフォームが存在する
    expect(page).to have_selector 'form'
  end

  it 'ログインしていない状態で詳細ページに遷移しようとするとログインページに遷移される' do
    # 詳細ページに遷移する
    visit post_path(@post)

    # ログインしていない場合、ログインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path
  end
end

RSpec.describe '投稿編集機能', type: :system do
  before do
    @post1 = FactoryBot.create(:post)
    @post2 = FactoryBot.create(:post)
  end

  context '投稿を編集できるとき' do
    it 'ログインしたユーザーは自分の投稿を編集できる' do
      # 投稿１を投稿したユーザーでログインする
      sign_in(@post1.user)

      # 編集ページへ遷移する
      visit edit_post_path(@post1)

      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#post-caption').value
      ).to eq @post1.caption

      # 投稿内容を編集する
      video_path = Rails.root.join('public/videos/test2.mp4')
      attach_file('post[video]', video_path, make_visible: true)
      fill_in 'post-caption', with: "#{@post1.caption}+編集したテキスト"

      # 編集してもPostモデルのカウントは変わらないことを確認する
      expect {
        find('input[name="commit"]').click
      }.to change { Post.count }.by(0)

      # 編集に成功すると詳細ページに遷移したことを確認する
      expect(current_path).to eq post_path(@post1)
    end
  end

  context '投稿を編集できないとき' do
    it 'ログインしたユーザーは自分以外の投稿の編集画面には遷移できない' do
      # 投稿１を投稿したユーザーでログインする
      sign_in(@post1.user)

      # 投稿2の編集ページへ遷移する
      visit edit_post_path(@post2)

      # トップページに遷移されることを確認する
      expect(current_path).to eq root_path
    end

    it 'ログインしていないユーザーは編集画面に遷移できずログイン画面に遷移される' do
      # 投稿ページへ遷移する
      visit edit_post_path(@post1)

      # ログインしていない場合、ログインページに遷移されていることを確認する
      expect(current_path).to eq new_user_session_path
    end
  end
end