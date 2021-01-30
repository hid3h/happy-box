import StimulusController from "./stimulus_controller"

export default class extends StimulusController {

  swithCardBodyVisible(event) {
    const cardBodyEl = event.currentTarget.querySelector('[data-card-body]')
    // currentTargetがおしたそのものの要素っぽい？targetだと少しちがう。
    if (cardBodyEl.classList.contains("invisible")) {
      cardBodyEl.classList.remove("invisible")
    } else {
      cardBodyEl.classList.add("invisible")
    }
  }
}
