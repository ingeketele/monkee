import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

// const flatpickr = require("flatpickr");

const initFlatpickr = () => {
  const date = document.querySelector(".date_wrapper");
  flatpickr(date, {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
  });
};

export { initFlatpickr };
