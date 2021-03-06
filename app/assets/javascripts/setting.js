
$(window).load(function(){

function initMap(){};

  var $subcontinents = $('#subcontinent');
  var original_subcontinents = $subcontinents.html();
  var $countries = $('#country');
  var original_countries = $countries.html();
  var $cities = $('#city_id');
  var original_cities = $cities.html();

    $('#continent').change(function(){
      console.log("a");
         var val1 = $(this).val();
         $subcontinents.html(original_subcontinents).find('option').each(function(){
         var val2 = $(this).data('val');

         if (val1 != val2) {
          $(this).not(':first-child').remove();
         }
         });
      if ($(this).val() == "") {
        $subcontinents.attr('disabled', 'disabled');
      } else {
        $subcontinents.removeAttr('disabled');
      }

        $.ajax({
          type: 'GET',
          // リクエストURL
          url: '/uploads/new',
          // タイムアウト(ミリ秒)
          timeout: 10000,
          // キャッシュするかどうか
          cache: true,
          // サーバに送信するデータ(name: value)
          data: {
            'continent': val1
          }
        });
  });

    $('#subcontinent').change(function(){
      console.log("b");
         var val3 = $(this).val();
         $countries.html(original_countries).find('option').each(function(){
         var val4 = $(this).data('val');

         if (val3 != val4) {
          $(this).not(':first-child').remove();
         }
         });
      if ($(this).val() == "") {
        $subcontinents.attr('disabled', 'disabled');
      } else {
        $subcontinents.removeAttr('disabled');
      }

        $.ajax({
          type: 'GET',
          // リクエストURL
          url: '/uploads/new',
          // タイムアウト(ミリ秒)
          timeout: 10000,
          // キャッシュするかどうか
          cache: true,
          // サーバに送信するデータ(name: value)
          data: {
            'subcontinent': val3
          }
        });
  });

    $('#country').change(function(){
      console.log("c");
         var val5 = $(this).val();
         $cities.html(original_cities).find('option').each(function(){
         var val6 = $(this).data('val');

         if (val5 != val6) {
          $(this).not(':first-child').remove();
         }
         });
      // if ($(this).val() == "") {
      //   $subcontinents.attr('disabled', 'disabled');
      // } else {
      //   $subcontinents.removeAttr('disabled');
      // }
        $.ajax({
          type: 'GET',
          // リクエストURL
          url: '/uploads/new',
          // タイムアウト(ミリ秒)
          timeout: 10000,
          // キャッシュするかどうか
          cache: false,
          // サーバに送信するデータ(name: value)
          data: {
            'country': val5
          },
          success: function(data){
            $('#city_id').autocomplete({
              source: data,
              autoFocus: true,
              delay: 500,
              minLength: 2
            });
// ここに送信の内容
          }
        });
  });
});

function initMap(){};
$("#regions_div").ready(function(){

    google.charts.load('current', {'packages':['geochart']});

    if (gon.resolution=="city"){
      google.charts.setOnLoadCallback(drawMarkersMap);
      function drawMarkersMap() {

        var data = google.visualization.arrayToDataTable(gon.data);

        var options = {
          width: 1200,
          height: 600,
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
          chartArea: {left:10,top:10,bottom:0,height:"100%"},
          backgroundColor: '#81d4fa'
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

