import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('select2').select2({
    placeholder: "Categories"
  });

  $('select2').select2({
    placeholder: "Age"
  });
};

export { initSelect2};
