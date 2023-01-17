import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import { FullscreenController } from "./controllers/fullscreen_controller"
import { JobSlideshowController } from "./controllers/job_slideshow_controller"
import ujs from "@rails/ujs"
import Turbolinks from "turbolinks"
import twemoji from "twemoji"

Turbolinks.start()

try {
  ujs.start()
} catch {
  // Don't care about double initialization.
}

document.addEventListener("turbolinks:load", () => {
  twemoji.parse(document.body, {
    base: 'https://cdn.jsdelivr.net/gh/twitter/twemoji@14.0.2/assets/'
  })
})

const application = Application.start()
application.register("fullscreen", FullscreenController)
application.register("job_slideshow", JobSlideshowController)
