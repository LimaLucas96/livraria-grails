<%--
  Created by IntelliJ IDEA.
  User: lucas lima
  Date: 29/06/2019
  Time: 20:20
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main2">
    <title>pagina inicial</title>

    <asset:javascript src="flotChart.js"/>

    <sec:ifAllGranted roles="ROLE_ADMIN">
        <script type="text/javascript">
            $(document).ready(function () {
                $('#listaLivros').dataTable({
                    'pading':true,
                    'lengthChange':false
                });
            });
            $(function () {
                /*
                 * Flot Interactive Chart
                 * -----------------------
                 */
                // We use an inline data source in the example, usually data would
                // be fetched from a server
                var bar_data = {
                    data : [['Jan', 10], ['Fev', 0], ['Mar', 4], ['Apr', 13], ['Mai', 17], ['Jun', 9],['jul',30],
                    ['Ago',40],['Set',80]],
                    color: '#3c8dbc'
                }
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
                })
                $('<div class="tooltip-inner" id="bar-chart-tooltip"></div>').css({
                    position: 'absolute',
                    display : 'none',
                    opacity : 0.8
                }).appendTo('body')

                $('#bar-chart').bind('plothover', function (event, pos, item) {
                    console.log(item)
                    if (item) {
                        var x = item.datapoint[0].toFixed(2),
                            y = item.datapoint[1].toFixed(2)

                        $('#bar-chart-tooltip').html(item.series.label + ' of ' + x + ' = ' + y)
                            .css({ top: item.pageY + 5, left: item.pageX + 5 })
                            .fadeIn(200)
                    } else {
                        $('#bar-chart-tooltip').hide()
                    }

                })
            })
        </script>
    </sec:ifAllGranted>
</head>
<body>
    <!--Barra Lateral -->

    <g:render template="sidebarAdmin" />

    <div class="content-wrapper" >
        <sec:ifAllGranted roles="ROLE_ADMIN">
            <g:render template="bodyAdmin" model="[profile:profile]"/>
        </sec:ifAllGranted>
        <%--<a href="${request.contextPath}/j_spring_security_logout">sair</a> --%>
    </div>
</body>
</html>