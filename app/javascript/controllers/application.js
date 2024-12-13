import { Application } from "@hotwired/stimulus"
// app/javascript/packs/application.js
import './dynamic_city_dropdown';  // Add this line to import your custom JS

require("@rails/ujs").start();
require("turbolinks").start(); // For Turbo
require("channels");

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
