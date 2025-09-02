import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["searcherFields", "shelterFields"]

  connect() {
    console.log("Hello from our Stimulus controller");
  }

  toggle(event) {
    let user = event.currentTarget.value;
    if (user === "searcher") {
      this.searcherFieldsTarget.classList.toggle("d-none");
      this.shelterFieldsTarget.classList.add("d-none");
    } if (user === "shelter") {
      this.shelterFieldsTarget.classList.toggle("d-none");
      this.searcherFieldsTarget.classList.add("d-none");
    }
  }
}
