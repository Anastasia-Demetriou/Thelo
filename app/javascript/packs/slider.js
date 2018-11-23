// function makeItSlide() {
//   var snapSlider = document.getElementById('slider-snap');

//   noUiSlider.create(snapSlider, {
//       start: [0, 500],
//       snap: true,
//       connect: true,
//       range: {
//           'min': 0,
//           '10%': 50,
//           '20%': 100,
//           '30%': 150,
//           '40%': 500,
//           '50%': 800,
//           'max': 1000
//       }
//   });

//   var snapValues = [
//       document.getElementById('slider-snap-value-lower'),
//       document.getElementById('slider-snap-value-upper')
//   ];

//   snapSlider.noUiSlider.on('update', function (values, handle) {
//       snapValues[handle].innerHTML = values[handle];
//   });
// }

var select = document.getElementById('min_price');

// Append the option elements
for (var i = -20; i <= 40; i++) {

    var option = document.createElement("option");
    option.text = i;
    option.value = i;

    select.appendChild(option);
}

var html5Slider = document.getElementById('slider');

noUiSlider.create(html5Slider, {
    start: [200, 350],
    connect: true,
    tooltips: true,
    range: {
        'min': 1,
        'max': 500
    },
    format: wNumb({
        decimals: 3,
        thousand: '.',
        prefix: '£'
    })
});

var inputNumber = document.getElementById('max_price');

html5Slider.noUiSlider.on('update', function (values, handle) {

    var value = values[handle];

    if (handle) {
        inputNumber.value = Math.round(value);
    } else {
        select.value = Math.round(value);
    }
});

select.addEventListener('change', function () {
    html5Slider.noUiSlider.set([this.value, null]);
});

inputNumber.addEventListener('change', function () {
    html5Slider.noUiSlider.set([null, this.value]);
});

export { makeItSlide };
