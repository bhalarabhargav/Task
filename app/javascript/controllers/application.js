import { Application } from "@hotwired/stimulus"
// app/javascript/packs/application.js
import './dynamic_city_dropdown';  // Add this line to import your custom JS


const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
