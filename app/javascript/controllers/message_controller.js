import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="message"
// This Controller updates the class of a 'new message' when is
// added to the chat page.
// The 'sent' or 'recieved' style class change depending on whether
// the current user is the sender or the receiver of the new message.
export default class extends Controller {
  static values = { userRole: String }
  connect() {
    // triggered when a new message is added to the page
    const currentUserRole = document.body.dataset.currentUserRole;
    if (this.userRoleValue === currentUserRole) {
      this.element.classList.add('sent');
      this.element.classList.remove('received');
    } else {
      this.element.classList.add('received');
      this.element.classList.remove('sent');
    }
    this.element.scrollIntoView({ behavior: 'smooth' }); // scrolls to the bottom of the page
  }
}
