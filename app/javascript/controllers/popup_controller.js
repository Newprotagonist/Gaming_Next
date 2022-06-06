import { Controller } from "stimulus";
import tippy from 'tippy.js';
import "../stylesheets/components/_popup.scss";

export default class extends Controller {
  static targets = ["trigger", "content"]

  initialize() {
    this.initPopup();

    this.contentTarget.style.display = "none";
  }

  initPopup() {
    tippy(this.triggerTarget, {
      content: this.contentTarget.innerHTML,
      allowHTML: true,
    });
  }
}
