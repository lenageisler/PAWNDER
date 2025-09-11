import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

export default class extends Controller {
  static values = {
    message: String,
    url: String,
    method: String
  }

  confirm(event) {
    event.preventDefault()

    Swal.fire({
      title: this.messageValue || "Are you sure?",
      showCancelButton: true,
      confirmButtonText: "Yes, delete!",
      cancelButtonText: "Cancel"
    }).then((result) => {
      if (result.isConfirmed) {
        Turbo.request(this.urlValue, {
          method: this.methodValue || "delete"
        })
      }
    })
  }
}
