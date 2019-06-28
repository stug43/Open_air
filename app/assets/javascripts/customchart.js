
        
            
            chartIt();   
            async function chartIt() {
            const data = await getData();

                const ctx = document.getElementById('myChart').getContext('2d');

                const myChart = new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: data.xs,
                            datasets: [{
                                label: 'Mesures mensuelles de O3 (ozone)',
                                data: data.ys,
                                fill:false,
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
                                        // Include a dollar sign in the ticks
                                        callback: function(value, index, values) {
                                            return value + 'µg.m³';
                                        }
                                    }
                                }]
                            }
    }
                    });
                            }   

    async  function getData() {
                const xs = [];
                const ys = [];

        const response = await  fetch('test.csv');
        const data = await response.text();


        const table = data.split('\n').slice(1);
        table.forEach(row => {
            const columns = row.split(',');
            const city = columns[0];
            const deg = columns[1];
            ys.push(deg);
            const unit = columns[2];
            const month = columns[3];
            xs.push(month);
                

        });
        return { xs, ys };

        }

        