import 'bootstrap/js/dist/dropdown';
import 'bootstrap/js/dist/collapse';
import "bootstrap-table";
import "bootstrap-table/dist/bootstrap-table.min.css";
import 'bootstrap-table/dist/extensions/filter-control/bootstrap-table-filter-control.min.js';

const form = document.getElementById('jump-to-domain');
if (form) {
  form.addEventListener('submit', function(event) {
    event.preventDefault();
    const domainInput = <HTMLInputElement> document.getElementById('domain')

    if (domainInput) {
      const domain = domainInput.value
      window.location.href = "./domains/" + domain.replace('.', '-');
    }

    return false;
  });
}
