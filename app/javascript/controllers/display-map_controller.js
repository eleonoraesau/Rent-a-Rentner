import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static targets = [ "map" ]


  connect() {
  }
  show() {
    this.mapTarget.classList.remove("d-none")
    this.mapTarget.resize();

  }

  hide() {
    this.mapTarget.classList.add("d-none")
  }
}
