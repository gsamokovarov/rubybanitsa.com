import { Controller } from "stimulus"
import * as screenfull from "screenfull"

export default class extends Controller {
  connect() {
    if (screenfull.enabled) this.element.classList.add("fullscreen--supported")
  }

  enter() {
    screenfull.request()
  }
}
