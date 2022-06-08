import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share-modal"
export default class extends Controller {
  static targets = ["text"];

  connect() {
  }
  copy(event) {
    event.preventDefault()
    navigator.clipboard.writeText(this.textTarget.value)
  }
}
