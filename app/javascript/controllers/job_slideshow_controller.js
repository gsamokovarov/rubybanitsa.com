import { Controller } from "stimulus"

const SLIDE_SHOW_TIME = 3 * 60 * 1000 // 3 minutes
const SCROLL_BY_PIXELS = 1

export default class extends Controller {
  static targets = [ "slide" ]

  initialize() {
    this.direction = 1
    this.showCurrentSlide()
    this.scrollCurrentSlide()
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

  scrollCurrentSlide() {
    const loop = () => {
      scrollBy(0, this.scrollOffset)

      requestAnimationFrame(loop)
    }

    requestAnimationFrame(loop)
  }

  reverseDirection() {
    this.direction *= -1
  }

  get scrollOffset() {
    const body = document.body

    if (scrollY == 0) this.reverseDirection()
    if (scrollY + innerHeight == body.scrollHeight) this.reverseDirection()

    return this.direction * SCROLL_BY_PIXELS
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
