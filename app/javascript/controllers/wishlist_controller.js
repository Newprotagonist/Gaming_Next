import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs'

// Connects to data-controller="wishlist"
export default class extends Controller {

  connect() {
    console.log("hello you")
  }

  dragstart() {
    const list = document.querySelector("#wishlist")
    const initSortable = () => {
    Sortable.create(list)
    }
  }
}
