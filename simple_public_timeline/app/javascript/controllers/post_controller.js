import { Controller } from "@hotwired/stimulus"
import RelativeTime from '@yaireo/relative-time'

export default class extends Controller {
  static targets = ['time', 'posts']
  connect() {
    if (this.hasTimeTarget) {
      let timeStr = this.timeTarget.innerText;
      const relativeTime = new RelativeTime();
      this.timeTarget.innerText = relativeTime.from(new Date(timeStr));
    }
    if (this.hasPostsTarget) {
      let html = "";
      fetch("http://localhost:4567/1.1/statuses/status.json?count=20")
        .then(response => response.json())
        .then((tweetData) => {
          tweetData.forEach((tweet) => {
            html += this.postTemplate(tweet)
            html += "\n"
          });
          this.postsTarget.innerHTML = html;
        });
    }
  }
  postTemplate(tweet) {
    return `
    <hr/>
    <div class="post-grid-container">
      <div>
        <img src="${ tweet['user']['profile_image_url'] }"/>
      </div>
      <div className="post-text-container">
        ${tweet['user']['screen_name']} ${tweet['text']}
        <br/>
        <span>
          ${this.getRelativeTime(tweet['created_at'])}
        </span>
        <span> from ${this.getLinkText(tweet['source'])}</span>
      </div>
    </div>`
  }
  getLinkText(s) {
    var span = document.createElement('span');
    span.innerHTML = s;
    return span.textContent || span.innerText;
  }
  getRelativeTime(timeStr) {
    const relativeTime = new RelativeTime();
    return relativeTime.from(new Date(timeStr));
  }
}
