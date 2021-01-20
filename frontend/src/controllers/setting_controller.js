import StimulusController from "./stimulus_controller"

export default class extends StimulusController {

  initialize() {
    // 二回走ってる。
    console.count(document.documentElement.hasAttribute("data-turbo-preview"))
  }

  disconnect() {
    console.count('disco')
  }
}
