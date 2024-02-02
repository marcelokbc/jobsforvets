import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    document.addEventListener('turbo:load', () => {
      document.querySelectorAll('.copy-url').forEach((element) => {
        element.addEventListener('click', (e) => {
          e.preventDefault();
          var url = element.getAttribute('data-clipboard-text');
          navigator.clipboard.writeText(url)
            .then(() => {
              console.log('URL copiado com sucesso');
            })
            .catch((error) => {
              console.error('Erro ao copiar URL', error);
              console.log('URL copiado com sucesso');
            });
        });
      });
    });
  }
}
