import { Controller } from "@hotwired/stimulus";
import { computePosition, flip, shift, offset } from "@floating-ui/dom";

export default class extends Controller {
  static targets = ["trigger", "content", "menuItem"];
  static values = {
    open: {
      type: Boolean,
      default: false,
    },
    options: {
      type: Object,
      default: {},
    },
  };

  handleMouseOver() {
    this.openValue = true;
    this.#computeTooltip();
    this.contentTarget.classList.remove("hidden");
    // console.log(this.contentTarget);
  }

  #computeTooltip() {
    computePosition(this.triggerTarget, this.contentTarget, {
      placement: this.optionsValue.placement || "top",
      middleware: [flip(), shift(), offset(8)],
    }).then(({ x, y }) => {
      console.log(x, y);
      Object.assign(this.contentTarget.style, {
        left: `${x}px`,
        top: `${y}px`,
      });
    });
  }

  handleMouseOut() {
    console.log("Mouse out");
    this.openValue = false;
    this.contentTarget.classList.add("hidden");
  }
}
