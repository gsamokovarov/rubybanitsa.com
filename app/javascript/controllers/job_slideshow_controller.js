import { Controller } from "stimulus"

const SLIDE_SHOW_TIME = 60 * 1000 // 60 seconds
const SCROLL_BY_PIXELS = 10

export default class extends Controller {
  static targets = [ "slide" ]

  initialize() {
    this.showCurrentSlide()
  }

  connect() {
    this.slideInterval = setInterval(() => {
      this.showNextSlide()
    }, SLIDE_SHOW_TIME)
  }

  disconnect() {
    clearInterval(this.slideInterval)
  }

  showNextSlide() {
    this.index++
    this.showCurrentSlide()
  }

  showCurrentSlide() {
    this.slideTargets.forEach((el, i) => {
      el.classList.toggle("slide--current", this.index == i)
    })
  }

  get index() {
    const index = +this.data.get("index")
    if (index >= this.slideTargets.length) {
      return 0
    }

    return index
  }

  set index(value) {
    this.data.set("index", value)
  }
}
