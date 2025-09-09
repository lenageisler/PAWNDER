import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-form-div"
export default class extends Controller {
  static targets = ["body", "plus", "minus"]

  connect() {
  }

  toggle(event) {
    this.bodyTarget.classList.toggle("d-none")
    this.plusTarget.classList.toggle("d-none")
    this.minusTarget.classList.toggle("d-none")
  }
}
