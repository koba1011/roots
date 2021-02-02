require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#create' do
    before do
      @post = FactoryBot.build(:post)
    end
    
    context '投稿ができるとき' do
      it 'videoとcaptionが存在していれば保存できること' do
        expect(@post).to be_valid
      end

      it 'youtube_urlとcaptionが存在していれば保存できること' do
        @post.video = nil
        @post.youtube_url = "https://www.youtube.com/watch?v=7NVEpjR9xak"
        expect(@post).to be_valid
      end
    end

    context '投稿ができないとき' do
      it 'videoとyoutube_urlが両方選択されていると保存できないこと' do
        @post.youtube_url = "https://www.youtube.com/watch?v=7NVEpjR9xak"
        @post.valid?
        expect(@post.errors.full_messages).to include("ビデオまたはYoutube動画URLのどちらか一方を選択してください")
      end

      it 'videoかyoutube_urlどちらも選択されていないと保存できないこと' do
        @post.video = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("ビデオまたはYoutube動画URLのどちらか一方を選択してください")
      end

      it 'captionが空では保存できないこと' do
        @post.caption = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("タイトルを入力してください")
      end
    end
  end
end
