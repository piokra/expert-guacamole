function main() {
  function createPopUpManager(parent) {
    var ret = {};
    ret.parent = parent;
    ret.createPopUp = function (xsize, ysize) {
      var popup = document.createElement("div");
      var bar = document.createElement("div");
      var close = document.createElement("div");
      var minimize = document.createElement("div");
      var toggleSize = document.createElement("div");
      var body = document.createElement("div");
      popup.style.zIndex = 1;
      popup.appendChild(bar);
      popup.appendChild(body);
      bar.appendChild(minimize);
      bar.appendChild(toggleSize);
      bar.appendChild(close);

      popup.style.width = xsize;
      popup.style.height = ysize;
      

      //popup
      popup.classList.add("popup");
      //popup bar
      bar.classList.add("popup-element", "popup-bar");
      //popup body
      body.classList.add("popup-element", "popup-body");
      //popup buttons
      close.classList.add("popup-element", "popup-bar-button", "popup-bar-button-close");
      minimize.classList.add("popup-element", "popup-bar-button", "popup-bar-button-minimize");
      toggleSize.classList.add("popup-element", "popup-bar-button", "popup-bar-button-toggle");



      this.parent.appendChild(popup);


    }
    return ret;
  }
  document.popupManager = createPopUpManager(document.body);
  document.popupManager.createPopUp(700,100);
}


$(document).ready(main);
