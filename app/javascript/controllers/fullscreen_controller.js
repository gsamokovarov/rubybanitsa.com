import { Controller } from "stimulus"
import * as screenfull from "screenfull"

const BUTTON_VISIBILITY_TIMEOUT = 500

export default class extends Controller {
  static targets = ["toggle"]

  connect() {
    if (screenfull.enabled) this.element.classList.add("fullscreen--supported")

    screenfull.on('change', () => {
      this.toggleTarget.style.display = screenfull.isFullscreen ? "none" : "initial"
    })
  }

  toggle() {
    screenfull.toggle()
  }
}
