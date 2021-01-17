import { Controller } from "stimulus"
import { Chart } from 'chart.js'

export default class extends Controller {
  static values = { graphData: Object }

  connect() {
    // 二回走ってる。
    console.count(this.graphDataValue)
    this.setChart()
  }
  
  setChart() {
    const ctx = document.getElementById('myChart').getContext('2d');

    const axisCount = 12;
    const labels = [...Array(axisCount)].map((_, index) => {
      return `${index + 1}月`
    })

    const dataArray = Object.values(this.graphDataValue)

    new Chart(ctx, {
      type: 'bar',
      data: {
        labels: labels,
        datasets: [{
          // label: '# of Votes',
          data: dataArray,
          backgroundColor: [
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)'
          ],
          borderColor: [
              'rgba(255, 99, 132, 1)',
              'rgba(54, 162, 235, 1)',
              'rgba(255, 206, 86, 1)',
              'rgba(75, 192, 192, 1)',
              'rgba(153, 102, 255, 1)',
              'rgba(255, 159, 64, 1)'
          ],
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true
            }
          }]
        }
      }
    });
  }
}
