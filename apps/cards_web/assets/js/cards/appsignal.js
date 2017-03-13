import Chart from "chart.js";

export default class Appsignal {
  constructor ($card) {
    Chart.defaults.global.defaultFontColor = "#fff";

    var $canvas = $card.find("[data-appsignal-container]");

    var labels = $canvas.data("appsignal-labels");
    var values = $canvas.data("appsignal-data");

    var data = {
      labels: labels,
      datasets: [{
        data: values,
        label: "Visits",
        pointRadius: 0,
        borderColor: "#fff",
        backgroundColor: "rgba(0, 0, 0, .4)",
        fill: true
      }]
    };

    var myLineChart = new Chart($canvas, {
      type: 'line',
      data: data,
      options: {responsive: true, maintainAspectRatio: false}
    });
  }
}
