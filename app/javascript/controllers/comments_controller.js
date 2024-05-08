import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ["collapse", "button"];

    connect() {
        this.toggleComments();
    }

    toggleComments() {
        if (this.hasCollapseTarget) {
            this.collapseTarget.classList.toggle("show");
            this.buttonTarget.innerText = this.collapseTarget.classList.contains("show") ? "Hide comments" : "Show comments";
        }
    }
}
