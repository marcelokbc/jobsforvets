import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    document.addEventListener('turbo:load', () => {
    const dismissButton = document.getElementById('dismiss-button');
      if (dismissButton) {
        dismissButton.addEventListener('click', () => {
          const alert = dismissButton.closest('.alert');
  
          if (alert) {
            const alertDismissAfterValue = alert.dataset.alertDismissAfterValue;
  
            alert.classList.add('hidden');
  
            setTimeout(() => {
              alert.remove();
            }, alertDismissAfterValue);
          }
        });
      }
    });
  }
}
