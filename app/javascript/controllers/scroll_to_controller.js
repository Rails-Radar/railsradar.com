import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="scroll-to"
export default class extends Controller {
  static values = {
    position: String,
  };

  scroll() {
    const allEntries = document.querySelectorAll("details");

    allEntries.forEach((entry) => {
      entry.open = false;
    });

    const targetElement = document.getElementById(this.positionValue);
    if (targetElement) {
      targetElement.scrollIntoView({ behavior: "smooth" });
      targetElement.open = true;
    }
  }
}
