// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import { application } from "./application";
import * as bootstrap from "bootstrap"
import "bootstrap"
import "../stylesheets/application"
import "./controllers";


//= require bootstrap-sprockets


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
  import "controllers"
