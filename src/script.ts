import 'bootstrap/js/dist/dropdown';
import 'bootstrap/js/dist/collapse';
import "bootstrap-table";
import "bootstrap-table/dist/bootstrap-table.min.css";
import 'bootstrap-table/dist/extensions/filter-control/bootstrap-table-filter-control.min.js';

const anchorJS = require('anchor-js');
const anchors = new anchorJS();
anchors.add();

const form = document.getElementById('jump-to-domain');
const base_url_tag = document.getElementById('base-url');
let base_url = ""

if (base_url_tag) {
  base_url = base_url_tag.getAttribute('data-base-url') || "";
}

if (form) {
  form.addEventListener('submit', function(event) {
    event.preventDefault();
    const domainInput = <HTMLInputElement> document.getElementById('domain')

    if (domainInput) {
      const domain = domainInput.value
      window.location.href = base_url + "/domains/" + domain.replace('.', '-');
    }

    return false;
  });
}
