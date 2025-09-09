import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

// import ToggleSignupFieldsController from "./toggle_signup_fields_controller.js"
// Stimulus.register("toggle-signup-fields", ToggleSignupFieldsController)
