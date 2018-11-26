import "bootstrap";
import "../plugins/flatpickr"
import "./map.js";
import "./user_profile_navbar.js";

import { makeItSlide } from "./slider.js";
import $ from 'jquery'
const btn = $('#login_button')
const email = $('#user_email')
const password = $('#user_password')

const disableRemover = () => {
  console.log('test')
  if (email.value && password.value) {
    $(btn).removeAttr('disabled')
  } else {
    $(btn).attr('disabled', null)
  }
}

$(document).ready(() => {
  setTimeout(disableRemover, 500)
  $('#new_user').change(disableRemover)
  //$(password).keyup(disableRemover)
  //$(email).keyup(disableRemover)
})
makeItSlide();

