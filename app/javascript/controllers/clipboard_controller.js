import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.element.addEventListener('click', (e) => {
      e.preventDefault();
      var url = this.element.getAttribute('data-clipboard-text');
      navigator.clipboard.writeText(url)
        .then(() => {
          alert('URL copiado com sucesso!');
        })
        .catch((error) => {
          alert('Erro ao copiar URL!');
        });
    });
  }
}