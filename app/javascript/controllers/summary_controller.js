import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.setupEventListeners();
  }

  setupEventListeners() {
    const countTextarea = this.element.querySelector('.count-textarea');
    const currentSpan = this.element.querySelector('#current');

    if (countTextarea && currentSpan) {
      this.inputHandler = this.handleInput.bind(this);
      countTextarea.addEventListener('input', this.inputHandler);
    }
  }

  handleInput() {
    const countTextarea = this.element.querySelector('.count-textarea');
    const currentSpan = this.element.querySelector('#current');

    if (countTextarea && currentSpan) {
      const characterCount = countTextarea.value.length;
      currentSpan.textContent = characterCount;
    }
  }
}
