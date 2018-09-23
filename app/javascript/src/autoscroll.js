import { Controller } from "stimulus"

const SCROLL_TIMEOUT = 500 // milliseconds

export const Up = +1
export const Down = -1

export class Autoscroll {
  constructor(element, {offset, direction} = {}) {
    this.element = element
    this.offset = offset || 1
    this.direction = direction || Up
    this.screenRepeatQueue = []

    this.element.addEventListener("scroll", () => {
      this.paused = true

      clearTimeout(this.resume)
      this.resume = setTimeout(() => {
        this.paused = false
      }, SCROLL_TIMEOUT)
    })
  }

  start() {
    this.cancel = requestAnimationFrame(this.loop.bind(this))
  }

  stop() {
    cancelAnimationFrame(this.cancel)
    clearTimeout(this.resume)
  }

  enqueueForScreenRepeat(action) {
    this.screenRepeatQueue.push(action)
  }

  // Private

  loop() {
    if (!this.paused) {
      if (scrollY <= 0) this.setDirection(Up)
      if (scrollY + innerHeight >= this.element.scrollHeight) this.setDirection(Down)

      scrollBy(0, this.direction * this.offset)
    }

    requestAnimationFrame(this.loop.bind(this))
  }

  setDirection(direction = Down) {
    this.direction = direction

    if (this.direction == Up) {
      const action = this.screenRepeatQueue.shift()
      if (action) action()
    }
  }
}
