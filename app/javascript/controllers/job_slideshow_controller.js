import { Controller } from "stimulus"
import { Autoscroll } from "../src/autoscroll"

const SLIDE_SHOW_TIME = 3 * 60 * 1000 // 3 minutes

export class JobSlideshowController extends Controller {
  static targets = ["slide"]

  initialize() {
    this.showCurrentSlide()
    this.autoscroll = new Autoscroll(document.body)
  }

  connect() {
    this.slideInterval = setInterval(this.enqueueNextSlide.bind(this), SLIDE_SHOW_TIME)
    this.autoscroll.start()
  }

  disconnect() {
    clearInterval(this.slideInterval)
    this.autoscroll.stop()
  }

  enqueueNextSlide() {
    this.index++
    this.autoscroll.enqueueForScreenRepeat(this.showCurrentSlide.bind(this))
  }

  showCurrentSlide() {
    this.slideTargets.forEach((el, i) => {
      el.classList.toggle("slide--current", this.index == i)
    })
  }

  get index() {
    const index = +this.data.get("index")
    if (index >= this.slideTargets.length) return 0
    return index
  }

  set index(value) {
    this.data.set("index", value)
  }
}
