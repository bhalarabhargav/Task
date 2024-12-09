// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { application } from "./application";
import * as bootstrap from "bootstrap"
import "bootstrap"
import "../stylesheets/application"
import "./controllers";
import "./state_select"
import FilePreviewController from "./file_preview_controller";
application.register("file-preview", FilePreviewController);
import './dynamic_city_dropdown';  // Add this line to import your custom JS


//= require bootstrap-sprockets
stateSelect.addEventListener("change", async function () {
  const selectedState = stateSelect.value;
  console.log("Selected state:", selectedState);

  if (selectedState) {
    const response = await fetch(`/cities?state=${selectedState}`);
    const data = await response.json();
    console.log("Fetched cities data:", data); // Debug fetched data
  }
});


document.addEventListener("DOMContentLoaded", () => {
    const navbarToggler = document.querySelector(".navbar-toggler");
    const navbarBackdrop = document.getElementById("navbar-backdrop");
  
    navbarToggler.addEventListener("click", () => {
      navbarBackdrop.classList.toggle("show");
    });
  
    navbarBackdrop.addEventListener("click", () => {
      const collapsibleNavbar = document.getElementById("collapsibleNavbar");
      collapsibleNavbar.classList.remove("show");
      navbarBackdrop.classList.remove("show");
    });
  });

