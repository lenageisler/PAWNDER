import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["thumbnail"]

  connect() {
    console.log("Hello from our Stimulus controller");
  }

  switch(event) {
    const fullUrl = event.currentTarget.dataset.full
    const mainImage = document.getElementById("main-dog-image")
    if (mainImage) {
      mainImage.src = fullUrl
    }
  }
}
