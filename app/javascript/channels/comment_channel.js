import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
  },

  disconnected() {
  },
  received(data) {
    const comments = document.getElementById('comments');
    const comment = document.getElementsByClassName('comment-display');
    //使用する要素の作成
    const textElement = document.createElement('div');
    textElement.setAttribute('class', "comment-display");
    const topElement = document.createElement('div');
    topElement.setAttribute('class', "comment-top");
    const nameElement = document.createElement('span');
    nameElement.setAttribute('class', "comment-user-name")
    const timeElement = document.createElement('span');
    timeElement.setAttribute('class', "comment-time");
    const bottomElement = document.createElement('div');
    bottomElement.setAttribute('class', "comment-bottom");
    // 生成したHTMLの要素をブラウザに表示させる
    comments.insertBefore(textElement, comments.firstElementChild);
    textElement.appendChild(topElement);
    textElement.appendChild(bottomElement);
    topElement.appendChild(nameElement);
    topElement.appendChild(timeElement);
     // 表示するテキストを生成
    const name = `${data.username}`;
    nameElement.innerHTML = name;
    const time = `1秒前`;
    timeElement.innerHTML = time;
    const text = `<p>${data.content.text}</p>`;
    bottomElement.innerHTML = text;
    //コメントを送った後、コメント欄をからにする
    const newComment = document.getElementById('comment_text');
    newComment.value='';
    const inputElement = document.querySelector('input[name="commit"]');
    inputElement.disabled = false;
  }
});