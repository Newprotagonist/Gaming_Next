import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="wishlist"
export default class extends Controller {

  connect() {
    console.log("hello you")
    this.dragstart()
  }

  dragstart() {
    const list = document.querySelector("#wishlist")
    const initSortable = () => {
    Sortable.create(list)
    }
  }
}
