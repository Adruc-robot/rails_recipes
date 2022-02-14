import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    show() {
        console.log("working");
        let tModal = document.getElementById("myModal");
        console.log(tModal);
        let modTit = document.getElementById("recNam");
        console.log(modTit);
        let tName = this.element.getAttribute('data-name');
        let modStps = document.getElementById("recSteps");
        console.log(modStps);
        let modIng = document.getElementById("recIngs");
        tModal.parentNode.classList.remove("noShow");
        modTit.innerHTML = tName;
        modStps.innerHTML = "<p>Steps:</p>" + this.element.getAttribute("data-steps");
        modIng.innerHTML = "    <p>Ingredients:</p>" + this.element.getAttribute('data-ingredients');
    }
    modalClose() {
        document.getElementById("myModal").parentNode.classList.add("noShow");
    }

}