import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="aichat"
export default class extends Controller {
  static targets = [ "window", "floatingQ", "xBtn" ]
  connect() {
  }

  open() {
    // event.preventDefault() // is here in case I want to use an <a>
    this.windowTarget.classList.remove("d-none")
    this.floatingQTarget.classList.add("d-none") // hide the button
    this.xBtnTarget.classList.remove("d-none") // shows the x button
  }

  close() {
    this.windowTarget.classList.add("d-none")
    this.floatingQTarget.classList.remove("d-none") // show the button again
    this.xBtnTarget.classList.add("d-none") // remove the x button
  }
}
