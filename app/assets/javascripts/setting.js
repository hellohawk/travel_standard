// $(document).ready(function() {

console.log(gon.resolution);

$("#regions_div").ready(function(){

    google.charts.load('current', {'packages':['geochart']});

    if (gon.resolution=="city"){
      google.charts.setOnLoadCallback(drawMarkersMap);
      function drawMarkersMap() {

        var data = google.visualization.arrayToDataTable(gon.data);

        var options = {
          region: gon.region,
          resolution: gon.resolution,
          backgroundColor: '#81d4fa',
          displayMode: 'markers',
          colorAxis: {colors: ['green', 'blue']}
        };

        var geochart = new google.visualization.GeoChart(document.getElementById('regions_div'));

          geochart.draw(data, options);

          google.visualization.events.addListener(geochart, 'regionClick', function(eventData) {
            options['region'] = eventData.region;
            options['resolution']='city';
            window.location = '?region=' + eventData.region + "&resolution=" + options['resolution'] ;
          });
      };
    }else{
      google.charts.setOnLoadCallback(drawRegionsMap);
      function drawRegionsMap() {

        var data = google.visualization.arrayToDataTable(gon.data);

        var options = {
          backgroundColor: '#81d4fa',
          enableRegionInteractivity: 'true',
          width: 556,
          height: 347
        };

        options['colorAxis'] = { minValue : 0, maxValue : 1, colors : ['#FF0000','#0000FF']};
        if(gon.region!="001"){
          options['region'] = gon.region;
        };
        options['resolution'] = gon.resolution;

        var geochart = new google.visualization.GeoChart(document.getElementById('regions_div'));

        geochart.draw(data, options);

        google.visualization.events.addListener(geochart, 'regionClick', function(eventData) {
    // maybe you want to change the data table here...
          options['region'] = eventData.region;
          if (options['resolution']=='continents'){
              options['resolution']='subcontinents';
              window.location = 'uploads/search/?region=' + eventData.region + "&resolution=" + options['resolution'] ;
          } else if (options['resolution']=='subcontinents') {
              options['resolution']='country';
              window.location = '?region=' + eventData.region + "&resolution=" + options['resolution'] ;
          } else if (options['resolution']=='country') {
            options['resolution']='city';
            window.location = '?region=' + eventData.region + "&resolution=" + options['resolution'] ;
          };
        });
      };
    };
  });

