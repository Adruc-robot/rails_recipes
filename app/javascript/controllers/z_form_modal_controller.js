import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"
// Connects to data-controller="z-form-modal"
export default class extends Controller {
  connect() {
    //initializes modal - right now, it will loop through all elements with the data-controller="z-form-modal" and execute the connect function. I only want to initialize staticBackdrop - could probably create another controller just for the initialization...
    if (this.element.id == "staticBackdrop") {
      let myModal = new Modal(this.element);
    }
  }
  submitEnd(e) {
    //closes modal after submit
    if (e.detail.success) {
      this.hideModal()
    }
  }
  hideModal() {
    this.element.remove()
    Modal.getInstance(document.getElementById("staticBackdrop")).hide()
  }
  showModal() {
    Modal.getInstance(document.getElementById("staticBackdrop")).show()
  }
}
