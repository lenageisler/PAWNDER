import { Controller } from '@hotwired/stimulus'

export default class extends Controller {

  connect() {
    console.log("Hello from our Stimulus controller");
  }

  toggle(event) {
    console.log(event);
  }
}
