import { Controller } from "@hotwired/stimulus";
import IMask from 'imask';

export default class extends Controller {
  connect() {
    // Mask
    let cpf = document.getElementById('applicant_cpf');
    IMask(cpf, { mask: '000.000.000-00' });

    let zipcode = document.getElementById("applicant_zipcode");
    IMask(zipcode, { mask: '000.00-000' });

    let phone = document.getElementById("applicant_phone");
    IMask(phone, { mask: '(00) 00000-0000' });

    zipcode.addEventListener("input", async (e) => {
      const cep = e.currentTarget.value.replace(/\D+/g, "");
      if (cep.length === 8) {
        const url = `https://viacep.com.br/ws/${cep}/json/`;

        // const response = await axios.get(url);
        fetch(url)
        .then((response) => response.json())
        .then((data) => {
          if (data.cep) {
            document.getElementById("applicant_street").value =
            data.logradouro;
            document.getElementById("applicant_neighborhood").value =
              data.bairro;
            document.getElementById("applicant_state").value = data.uf;
            document.getElementById("applicant_city").value = data.localidade;
            
          } else {
            document.getElementById("applicant_street").value = "CEP Inválido";
            document.getElementById("applicant_neighborhood").value = "CEP Inválido";
          }
        });

      } else {
        document.getElementById("applicant_street").value = "";
        document.getElementById("applicant_neighborhood").value = "";
        document.getElementById("applicant_state").value = "";
      }
    });
  } 
}
