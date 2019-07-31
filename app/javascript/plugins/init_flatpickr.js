import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

// const flatpickr = require("flatpickr");

const initFlatpickrCreateActivity = () => {
  const date = document.querySelector(".date_wrapper");
  flatpickr(date, {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
  });
};

const initFlatpickrFindActivity = () => {
  const searchDate = document.querySelector(".date_search_wrapper");
  flatpickr(searchDate, {
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d",
    onChange: function(selectedDates) {},
  });

};

export { initFlatpickrFindActivity };
export { initFlatpickrCreateActivity };
