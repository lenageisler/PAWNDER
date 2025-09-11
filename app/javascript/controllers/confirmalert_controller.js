// import { Controller } from "@hotwired/stimulus"
// import Swal from "sweetalert2"

// export default class extends Controller {
//   static values = {
//     message: String,
//     url: String,
//     method: String
//   }

//   confirm(event) {
//     event.preventDefault()

//     Swal.fire({
//       title: this.messageValue || "Are you sure?",
//       showCancelButton: true,
//       confirmButtonText: "Yes, delete!",
//       cancelButtonText: "Cancel"
//     }).then((result) => {
//       if (result.isConfirmed) {
//         const token = document.querySelector('meta[name="csrf-token"]').content

//         fetch(this.urlValue, {
//           method: this.methodValue || "DELETE",
//           headers: {
//             "X-CSRF-Token": token,
//             "Accept": "text/vnd.turbo-stream.html"
//           }
//         }).then(() => {
//           // optional: redirect or remove element from DOM
//           Turbo.visit(window.location.href) // reload page
//         })
//       }
//     })
//   }
// }
//         Turbo.request(this.urlValue, {
//           method: this.methodValue || "delete"
//         })
//       }
//     })
//   }
// }
