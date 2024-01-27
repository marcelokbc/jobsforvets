import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.setupEventListeners();
    this.restoreCharacterCount();
  }

  setupEventListeners() {
    const countTextarea = this.element.querySelector('.count-textarea');

    if (countTextarea) {
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

      // Persist character count in session storage
      sessionStorage.setItem('characterCount', characterCount);
    }
  }

  restoreCharacterCount() {
    const currentSpan = this.element.querySelector('#current');

    if (currentSpan) {
      // Retrieve character count from session storage
      const characterCount = sessionStorage.getItem('characterCount');

      if (characterCount !== null) {
        currentSpan.textContent = characterCount;
      }
    }
  }
}
