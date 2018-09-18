import { Controller } from "stimulus"

export const Positive = +1
export const Negative = -1

export class Autoscroll {
  constructor(element, {offset, direction, onScreenRepeat} = {}) {
    this.element = element
    this.offset = offset || 1
    this.direction = direction || Positive
    this.onScreenRepeat = onScreenRepeat
  }

  start() {
    this.cancel = requestAnimationFrame(this.loop.bind(this))
  }

  stop() {
    if (this.cancel) cancelAnimationFrame(this.cancel)
  }

  loop() {
    if (scrollY == 0) this.reverseDirection()
    if (scrollY + innerHeight == this.element.scrollHeight) this.reverseDirection()

    scrollBy(0, this.direction * this.offset)

    requestAnimationFrame(this.loop.bind(this))
  }

  reverseDirection() {
    this.direction *= Negative

    if (this.direction == Positive) {
      if (this.onScreenRepeat) this.onScreenRepeat()
    }
  }
}
