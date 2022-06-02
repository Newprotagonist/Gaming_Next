import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

// Connects to data-controller="wishlist"
export default class extends Controller {

  connect() {
    console.log("hello you")
    this.Sortable = Sortable.create(this.element, {
      onEnd: this.persist.bind(this)
    })
  }

  // dragstart() {
  //   console.log('hi')
  //   const list = document.querySelector("#wishlist")
  //   const initSortable = () => {
  //   Sortable.create(list)
  //   }
  // }

  persist(event) {
    const list = document.querySelector("#wishlist")
    const listItems = list.querySelectorAll("li")
    const listIds = Array.from(listItems).map(item => item.dataset.id)
    const url = "/wishlist/${listIds}"
    const data = { wishlist: { list_items_attributes: listIds } }
    fetch(url, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify(data)
    })
  }

}
