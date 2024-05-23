import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["button"];
    toggleButtonText() {
        this.buttonTarget.innerText = this.buttonTarget.innerText == "Show Comments" ? "Hide Comments" : "Show Comments";
    }
}
