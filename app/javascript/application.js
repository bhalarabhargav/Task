// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

//= require rails-ujs
//= require_tree .

import { application } from "./application";
import * as bootstrap from "bootstrap"
import "bootstrap"
import "../stylesheets/application"
import "controllers";
import "@hotwired/turbo-rails"

import $ from "jquery"
require("@rails/ujs").start();
require("turbolinks").start(); // For Turbo
require("channels");




$(document).on("turbo:load", function() {
  console.log("Turbo: JavaScript loaded"); // Debug
});

import FilePreviewController from "./file_preview_controller";
application.register("file-preview", FilePreviewController);

console.log("Script loaded successfully");

typeof Turbo
Turbo.setProgressBarDelay(0);
Turbo.logger = console;




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

