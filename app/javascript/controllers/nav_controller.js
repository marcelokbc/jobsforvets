import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const buttonMenu = this.element.querySelector('#button-menu');
    const menuDropdown = this.element.querySelector('#menu-dropdown');
    const arrowIcon = this.element.querySelector('#arrow-icon');

    if (buttonMenu && menuDropdown && arrowIcon) {
      buttonMenu.addEventListener('click', (event) => {
        event.stopPropagation(); // Prevent the click event from reaching the document
        menuDropdown.classList.toggle('hidden');
        arrowIcon.classList.toggle('rotate-up');
      });

      document.addEventListener('click', (event) => {
        // Check if the clicked element is not the button or the dropdown
        if (!buttonMenu.contains(event.target) && !menuDropdown.contains(event.target)) {
          menuDropdown.classList.add('hidden');
          arrowIcon.classList.remove('rotate-down');
        }
      });
    }
  }
}
