//= require Flot/jquery.flot
//= require Flot/jquery.flot.resize
//= require Flot/jquery.flot.categories
$(document).ready(function () {
    carregarTabela()
});

function carregarTabela(){
    $.ajax({
        method: 'POST',
        url:'criarTabelaAno',
        success:function (data) {
            var bar_data = data.tabelaAno;
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
        }
    })
}
$(function () {
    $('<div class="tooltip-inner" id="bar-chart-tooltip"></div>').css({
        position: 'absolute',
        display : 'none',
        opacity : 0.8
    }).appendTo('body');

    $('#bar-chart').bind('plothover', function (event, pos, item) {
        if (item) {
               var y = item.datapoint[1];
               var x = item.series.data[item.dataIndex][0];
            $('#bar-chart-tooltip').html('livros alugados em ' + x+ ': ' + y )
                .css({ top: item.pageY + 5, left: item.pageX + 5 })
                .fadeIn(200)
        } else {
            $('#bar-chart-tooltip').hide()
        }
    })
});