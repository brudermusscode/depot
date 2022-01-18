import React from "react";
import ReactDOM from "react-dom";
import PayTypeSelector from "PayTypeSelector";

document.addEventListener("turbolinks:load", function (event) {
  if (!event.originalEvent.data.timing.visitStart) {
  } else {
    var element = document.getElementById("pay-type-component");
    ReactDOM.render(<PayTypeSelector />, element);
  }
});
