import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="aichat"
export default class extends Controller {
  static targets = [ "window", "toggle", "xtoggle" ]
  connect() {
  }

  open() {
    // event.preventDefault() // is here in case I want to use an <a>
    this.windowTarget.classList.remove("d-none")
    this.toggleTarget.classList.add("d-none") // hide the button
    this.xtoggleTarget.classList.remove("d-none") // shows the x button
  }

  close() {
    this.windowTarget.classList.add("d-none")
    this.toggleTarget.classList.remove("d-none") // show the button again
    this.xtoggleTarget.classList.add("d-none") // remove the x button
  }
}
