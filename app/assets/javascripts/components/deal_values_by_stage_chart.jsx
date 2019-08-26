class DealValuesByStageChart extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
          chart_labels: props.chart_labels,
          chart_data: props.chart_data
        };
    }
    componentDidMount() {
        const canvas_context = document.getElementById('deals-chart').getContext('2d');
        const data = this.state.chart_data;
        const labels = this.state.chart_labels;
        new Chart(canvas_context, {
            "type":"bar",
            "data":{
                "labels":labels,
                "datasets": [
                    {
                        "label":"Deals value by stage",
                        "data": data,
                        "fill":false,
                        "backgroundColor": [
                          "rgba(255, 99, 132, 0.4)",
                          "rgba(255, 159, 64, 0.4)",
                          "rgba(255, 205, 86, 0.4)",
                          "rgba(75, 192, 192, 0.4)",
                          "rgba(54, 162, 235, 0.4)",
                          "rgba(153, 102, 255, 0.4)",
                          "rgba(201, 203, 207, 0.4)"
                        ],
                        "borderColor":[
                          "rgb(255, 99, 132)",
                          "rgb(255, 159, 64)",
                          "rgb(255, 205, 86)",
                          "rgb(75, 192, 192)",
                          "rgb(54, 162, 235)",
                          "rgb(153, 102, 255)",
                          "rgb(201, 203, 207)"
                        ],
                        "borderWidth":1
                    }
                ]
            }
        });
    }
    render() {
        return (
            <canvas id="deals-chart"/>
        )
    }
}

