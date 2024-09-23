import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="rbui--alert-dialog"
export default class extends Controller {
  static targets = ["content"];
  static values = {
    open: {
      type: Boolean,
      default: false,
    },
  };

  connect() {
    console.log("asdf");
    if (this.openValue) {
      this.open();
    }
  }

  open() {
    console.log("dig open");
    document.body.insertAdjacentHTML("beforeend", this.contentTarget.innerHTML);
    // prevent scroll on body
    document.body.classList.add("overflow-hidden");
  }

  dismiss(e) {
    // allow scroll on body
    document.body.classList.remove("overflow-hidden");
    // remove the element
    this.element.remove();
  }
}
