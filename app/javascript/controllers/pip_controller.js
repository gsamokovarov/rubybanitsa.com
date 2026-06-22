import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tab", "frame"];

  connect() {
    const param = new URLSearchParams(window.location.search).get("layout");
    this.current = param || "broadcast";
    this.render();
  }

  select(event) {
    this.current = event.currentTarget.dataset.style;
    this.render();
  }

  render() {
    this.frameTargets.forEach((frame) => {
      frame.classList.toggle("hidden", frame.dataset.style !== this.current);
    });

    this.tabTargets.forEach((tab) => {
      const active = tab.dataset.style === this.current;
      tab.classList.toggle("bg-black", active);
      tab.classList.toggle("text-white", active);
    });
  }
}
