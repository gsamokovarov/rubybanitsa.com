import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="cache"
export default class extends Controller {
  static outlets = ["mobile-navigation"];

  connect() {
    document.addEventListener(
      "turbo:before-cache",
      this.beforeCache.bind(this),
    );
  }

  disconnect() {
    document.removeEventListener("turbo:before-cache", this.beforeCache);
  }

  beforeCache() {
    // Collapse the mobile navigation before Turbo caches the page.
    // This way the page would be in a good state when Turbo uses the cache on
    // browser's back button or displaying the page preview while loading the
    // fresh page.
    this.mobileNavigationOutlet.close();
  }
}
