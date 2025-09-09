import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

// ************** Heroku won't work if we add this lines. **********************
// import ToggleSignupFieldsController from "./toggle_signup_fields_controller.js"
// Stimulus.register("toggle-signup-fields", ToggleSignupFieldsController)
// It is ok to delete this lines because this import is already handle by
// 'eagerLoadControllersFrom' in the 'index.js'.
