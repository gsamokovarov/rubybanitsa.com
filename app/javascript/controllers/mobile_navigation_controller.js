import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="mobile-navigation"
export default class extends Controller {
  static targets = ["menu", "hamburgerIcon", "closeIcon"];

  static values = {
    open: { type: Boolean, default: false },
  };

  toggleOpen() {
    this.openValue = !this.openValue;
  }

  openValueChanged(open) {
    const headerClasses = ["fixed", "inset-0", "overflow-y-auto"];

    document.body.classList.toggle("overflow-hidden", open);

    this.menuTarget.classList.toggle("flex", open);
    this.menuTarget.classList.toggle("hidden", !open);

    if (open) {
      this.element.classList.add(...headerClasses);
      this.hamburgerIconTarget.classList.add("hidden");
      this.closeIconTarget.classList.remove("hidden");
    } else {
      this.element.classList.remove(...headerClasses);
      this.hamburgerIconTarget.classList.remove("hidden");
      this.closeIconTarget.classList.add("hidden");
    }
  }

  close() {
    this.openValue = false;
  }
}
