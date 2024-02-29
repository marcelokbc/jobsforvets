import { Controller } from "@hotwired/stimulus";
import IMask from 'imask';

export default class extends Controller {
  connect() {
    const phoneInput = this.element.querySelector('#applicant_phone');
    if (phoneInput) { 
      IMask(phoneInput, {
        mask: '(00) 00000-0000'
      });
    }
  } 
}
