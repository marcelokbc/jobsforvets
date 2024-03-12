import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const passwordToggle = this.element.querySelector('#toggle_password_visibility');
    const confirmationToggle = this.element.querySelector('#toggle_confirmation_visibility');
    const passwordField = this.element.querySelector('#user_password');
    const passwordConfirmationField = this.element.querySelector('#user_password_confirmation');

    const togglePasswordVisibility = () => {
      const eyeIconOpen = document.getElementById('eye_icon_open');
      const eyeIconClosed = document.getElementById('eye_icon_closed');

      if (passwordField.type === 'password') {
        passwordField.type = 'text';
        eyeIconOpen.style.display = 'none';
        eyeIconClosed.style.display = 'block';
      } else {
        passwordField.type = 'password';
        eyeIconOpen.style.display = 'block';
        eyeIconClosed.style.display = 'none';
      }
    };

    const toggleConfirmationVisibility = () => {
      const eyeIconOpen = document.getElementById('confirmation_eye_icon_open');
      const eyeIconClosed = document.getElementById('confirmation_eye_icon_closed');

      if (passwordConfirmationField.type === 'password') {
        passwordConfirmationField.type = 'text';
        eyeIconOpen.style.display = 'none';
        eyeIconClosed.style.display = 'block';
      } else {
        passwordConfirmationField.type = 'password';
        eyeIconOpen.style.display = 'block';
        eyeIconClosed.style.display = 'none';
      }
    };

    passwordToggle.addEventListener('click', togglePasswordVisibility);
    confirmationToggle.addEventListener('click', toggleConfirmationVisibility);
  }
}
