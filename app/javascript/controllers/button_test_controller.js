import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="button-test"
export default class extends Controller {
  connect() {
    var element = document.getElementsByClassName("search_content");
    console.log(element)

  }

  tester(e) {
    // onclick = "setResult(<%= p.title.to_json %>, this.parentNode.parentNode.parentNode.childNodes[0].id)"

    () => console.log(e)
  }
 }
