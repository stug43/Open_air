
new Chart(document.getElementById("line-chart"), {
  type: 'line',
  data: {
    labels: ['janvier','février', 'Mars' , 'avril', 'mai', 'juin', 'juillet', 'aout', 'septembre', 'octobre', 'novembre', 'décembre'],
    datasets: [{ 

      data: [0,
      0,
      0,
      0,
      0,
      0,
      0,
88.1,
79.6,
55.5,
43.7,
30.5,
],
        label: "Berre l'Etang",
        borderColor: "#3e95cd",
        fill: false
      }, { 
        data: [44.5,
38.8,
64.7,
77.7,
0,
67,
87.5,
69.4,
64.8,
53.6,
46.4,
27.5,
],
        data: [43,36.1,61.1,73.1,0,74.5,84.9,75.8,69.9,49.3,38.8,23.2],
        label: "Marseille",
        borderColor: "#3e95cd",
        fill: false
      }, { 
        data: [44.5,
38.8,
64.7,
77.7,
0,
67,
87.5,
69.4,
64.8,
53.6,
46.4,
27.5,
],
        label: "Aix-en-provence",
        borderColor: "#8e5ea2",
        fill: false
      }, { 
        data: [53.2,44.4,66.6,75.8,0,78.4,88.6,77.9,71.8,56.2,45.5,33.6],
        label: "Toulon",
        borderColor: "#3cba9f",
        fill: false
      }, { 

        data: [
0,
0,
0,
67.5,
92.7,
72.4,

83.6,
0,
90.3,
69.1,
47.9,
41.8,
],
        label: "Nice",
        borderColor: "#e8c3b9",
        fill: false
      }, { 
        data: [32.3,
44.2,
58.1,
78.2,
0,
66.7,
85.9,
63.9,
64.2,
42.1,
24.1,
28.5,
],
        label: "Gap",
        borderColor: "#c45850",
        fill: false
      }
    ]
  },
  options: {
    legend: { display: true,
    position: 'right', },
    title: {
      display: true,
      position: 'top',
      text: 'Mesures mensuelles Ozone'
    },
        scales: {
        yAxes: [{ 
          scaleLabel: {
            display: true,
            labelString: "(μg/m³)"
          }
        }],
        xAxes: [{ 
          scaleLabel: {
            display: true,
            labelString: "microgramme par mètre cube (μg/m³)"
          }
        }]
      }
    
  }
});

88.1
79.6
55.5
43.7
30.5
