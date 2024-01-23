import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    document.addEventListener('turbo:load', () => {
      const buttonMenu = document.getElementById('button-menu');
      const menuDropdown = document.getElementById('menu-dropdown');
      const arrowIcon = document.getElementById('arrow-icon');
    
      if (buttonMenu && menuDropdown && arrowIcon) {
        buttonMenu.addEventListener('click', () => {
          menuDropdown.classList.toggle('hidden');
          arrowIcon.classList.toggle('rotate-up');
        });
    
        document.addEventListener('click', (event) => {
          if (!buttonMenu.contains(event.target)) {
            menuDropdown.classList.add('hidden');
            arrowIcon.classList.remove('rotate-up');
          }
        });
      }
    });
  }
}
