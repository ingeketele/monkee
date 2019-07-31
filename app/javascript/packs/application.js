import 'mapbox-gl/dist/mapbox-gl.css';
import "bootstrap";

import { initFlatpickrCreateActivity, initFlatpickrFindActivity } from '../plugins/init_flatpickr';
import { initMapbox } from '../plugins/init_mapbox';

import 'select2/dist/css/select2.css';

import { initSelect2 } from '../components/init_select2';

initSelect2();
initMapbox();

initFlatpickrCreateActivity();
// initFlatpickrFindActivity();
