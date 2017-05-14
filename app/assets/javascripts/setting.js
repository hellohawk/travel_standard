// $(document).ready(function() {


$("#regions_div").ready(function(){

      google.charts.load('current', {'packages':['geochart']});
      google.charts.setOnLoadCallback(drawRegionsMap);

      function drawRegionsMap() {
            var data = google.visualization.arrayToDataTable([
          ['Country', 'part',{role: 'tooltip', p:{html:true}}],
          ['Eastern Africa', 200,'je'],
          ['Eastern Asia', 300,'je'],
          ['Australia', 400,'je']

        ]);

            var view = new google.visualization.DataView(data)
            view.setColumns([0, 1])

            var options = {
              region: 'world',
              resolution: 'continents',
              width: 556,
              height: 347
              // tooltip: {
              //   isHtml: true
              // }
            };

            var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));
            chart.draw(data, options);


     //       var geochart = new google.visualization.GeoChart(
     // document.getElementById('regions_div'));
     //       var options = { region: 'world', resolution: 'continents', width: 556, height: 347 };
     //       google.visualization.events.addListener(geochart, 'regionClick', function (eventData) {
     //           // maybe you want to change the data table here...
     //           options['region'] = eventData.region;
     //           options['resolution'] = 'continents';
     //           geochart.draw(data, options);
     //       });
     //       geochart.draw(data, options);

        };
        });

////////////
    //   function drawRegionsMap() {

    //     var data = google.visualization.arrayToDataTable([
    //        // ['Country', 'Popularity','tag'],

    //     // ['Area', 'Popularity'],
    //     // ['Africa', 200],
    //     // ['Europe', 300],
    //     // ['Americas', 400],
    //     // ['Asia', 500],
    //     // ['Oceania', 600]
    //     // ]);

    //        ['subcontinents', 'Popularity'],
    //       // Africa
    //     ['Northern Africa', 200],
    //     ['Western Africa', 300],
    //     ['Middle Africa', 400],
    //     ['Eastern Africa', 500],
    //       // Europe
    //     ['Northern Europe', 600],
    //     ['Western Europe', 600],
    //     ['Eastern Europe', 600],
    //     ['Southern Europe', 600],
    //       // Americas
    //     ['Northern America', 600],
    //     ['Caribbean', 600],
    //     ['Central America', 600],
    //     ['South America', 600],
    //       // Asia
    //     ['Central Asia', 600],
    //     ['Eastern Asia', 600],
    //     ['Southern Asia', 600],
    //     ['South-Eastern Asia', 600],
    //     ['Western Asia', 600],
    //      // Oceania
    //     ['Australia and New Zealand', 600],
    //     ['Melanesia', 600],
    //     ['Micronesia', 600],
    //     ['Polynesia', 600]
    //     ]);

    //     //     ['Country', 'Popularity','tag'],
    //     // ['Germany', 200,1],
    //     // ['United States', 300,0],
    //     // ['Brazil', 400,0],
    //     // ['Canada', 500,0],
    //     // ['France', 600,0],
    //     // ['RU', 700,0]
    //     //  ]);

    //     // //areaを指定するoption群
    //     // var options = {region: 'world', resolution: 'continents',width: 556,height: 347};
    //     // //sub-areaを指定するoption群
    //     var options = {
    //       region: 'world',
    //       backgroundColor: '#81d4fa',
    //       resolution: 'subcontinents',
    //       enableRegionInteractivity: 'true',
    //       width: 556,
    //       height: 347};
    //       options['colorAxis'] = { minValue : 0, maxValue : 1, colors : ['#FF0000','#0000FF']}

    //     // var options = {};

    //     // var options = {
    //     //   region: 'world',
    //     //   backgroundColor: '#81d4fa',
    //     //   resolution: 'countries',
    //     //   width: 556,
    //     //   height: 347};

    //     var geochart = new google.visualization.GeoChart(document.getElementById('regions_div'));

    // //     google.visualization.events.addListener(geochart, 'regionClick', function(eventData) {
    // // // maybe you want to change the data table here...
    // //       options['region'] = eventData.region;
    // //       options['resolution'] = 'countries';
    // //       geochart.draw(data, options);
    // //     });
    // geochart.draw(data, options);
    //   }
  // });

$("#chart_div").ready(function(){
      google.charts.load('current', {'packages': ['geochart']});
      google.charts.setOnLoadCallback(drawMarkersMap);

function drawMarkersMap() {
      var data = google.visualization.arrayToDataTable([
        ['City',   'Population', 'Area'],
        ['Rome',      2761477,    1285.31],
        ['Milan',     1324110,    181.76],
        ['Naples',    959574,     117.27],
        ['Turin',     907563,     130.17],
        ['Palermo',   655875,     158.9],
        ['Genoa',     607906,     243.60],
        ['Bologna',   380181,     140.7],
        ['Florence',  371282,     102.41],
        ['Fiumicino', 67370,      213.44],
        ['Anzio',     52192,      43.43],
        ['Ciampino',  38262,      11]
      ]);

      var options = {
        region: 'IT',
        backgroundColor: '#81d4fa',
        displayMode: 'markers',
        colorAxis: {colors: ['green', 'blue']}
      };

      var chart = new google.visualization.GeoChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    };
  });
// });



// $(document).ready(function() {

//   $('a.panel').click(function() {

//     $('a.panel').removeClass('selected');
//     $(this).addClass('selected');

//     current = $(this);

//     $('#wrapper').scrollTo($(this).attr('href'), 800);

//     return false;
//   });

//   $(window).resize(function() {
//     resizePanel();
//   });

// });

// function resizePanel() {

//   width = $(window).width();
//   height = $(window).height();

//   mask_width = width * $('.item').length;

//   $('#debug').html(width + ' ' + height + ' ' + mask_width);

//   $('#wrapper, .item').css({
//     width: width,
//     height: height
//   });
//   $('#mask').css({
//     width: mask_width,
//     height: height
//   });
//   $('#wrapper').scrollTo($('a.selected').attr('href'), 0);

// }