//= require Flot/jquery.flot
//= require Flot/jquery.flot.resize
//= require Flot/jquery.flot.categories


$(function () {

    var bar_data = {
        data : [['Jan', 10], ['Fev', 0], ['Mar', 4], ['Apr', 13], ['Mai', 17], ['Jun', 9],['jul',30],
            ['Ago',40],['Set',80]],
        color: '#3c8dbc'
    };
    $.plot('#bar-chart', [bar_data], {
        grid  : {
            hoverable:true,
            borderWidth: 1,
            borderColor: '#f3f3f3',
            tickColor  : '#f3f3f3'
        },
        series: {
            bars: {
                show    : true,
                barWidth: 0.8,
                align   : 'center'
            }
        },
        xaxis : {
            mode      : 'categories',
            tickLength: 0
        }
    });
    $('<div class="tooltip-inner" id="bar-chart-tooltip"></div>').css({
        position: 'absolute',
        display : 'none',
        opacity : 0.8
    }).appendTo('body')

    $('#bar-chart').bind('plothover', function (event, pos, item) {
        console.log(item)
        if (item) {
               var y = item.datapoint[1].toFixed(2)

            $('#bar-chart-tooltip').html('O numero de livros alugados: ' + y)
                .css({ top: item.pageY + 5, left: item.pageX + 5 })
                .fadeIn(200)
        } else {
            $('#bar-chart-tooltip').hide()
        }

    })
});