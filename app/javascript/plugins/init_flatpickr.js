import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!


const initFlatpickrCreateActivity = () => {
  document.querySelectorAll(".date_wrapper").forEach((flat) => {
    flatpickr(flat, {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
    });
  })
};

export { initFlatpickrCreateActivity };
