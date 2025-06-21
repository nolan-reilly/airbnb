import { Controller } from "@hotwired/stimulus";
import { enter, leave, toggle } from "el-transition";

export default class extends Controller {
  static targets = ["dropdown", "openUserMenu"];

  connect() {
    this.openUserMenuTarget.addEventListener("click", (e) => {
      dropdownOpen(this.dropdownTarget);
    });
  }
}

function dropdownOpen(element) {
  toggle(element).then(() => {});
}
