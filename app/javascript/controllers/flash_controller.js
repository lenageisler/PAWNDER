import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  static values = { delay: Number }

  connect() {
    if (this.hasDelayValue) {
      setTimeout(() => this.dismiss(), this.delayValue)
    }
  }

  dismiss() {
    this.element.classList.add("fade")
    this.element.classList.remove("show")

    this.element.addEventListener("transitionend", () => {
      this.element.remove()
    }, { once: true })
  }
}
