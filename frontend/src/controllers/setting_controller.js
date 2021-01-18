import { Controller } from "stimulus"

export default class extends Controller {

  initialize() {
    // 二回走ってる。
    console.count(document.documentElement.hasAttribute("data-turbolinks-preview"))
  }

  disconnect() {
    console.count('disco')
  }
}
