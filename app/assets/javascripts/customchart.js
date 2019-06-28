
        
            
            chartIt();   
            async function chartIt() {
            const data = await getData();

                const ctx = document.getElementById('myChart').getContext('2d');

                const myChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: ['00h', '01', '02', '03', '04h', '05h', '06h', '07h', '08h', '09h', '10h', '11h', '12h'],
                            datasets: [{
                                label: 'Mesures horaires de concentration en ozone',
                                data: [44.7, 41.5, 43.7, 57.7, 48.5, 31.4, 20.1, 55.8, 65.2, 74.8, 90.3, 107, 139.3 ],
                                fill:false,
                                
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true, 
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

        