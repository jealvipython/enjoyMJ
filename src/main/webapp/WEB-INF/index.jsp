<%@  page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/boot/css/bootstrap.min.css" rel="stylesheet">
<script src="/static/jquery/jquery-2.2.4.min.js"></script>
<script src="/boot/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.js"></script>
<script  >
    $(function () {
        $("#button").click(function(){
                    $('#table').bootstrapTable
                    ({
                        url: '/hello/world',
                        method: 'get',
                        dataType: 'json',
                        cache: false, //去缓存
                        pagination: true, //是否分页
                        sidePagination: 'server', //服务端分页
                        mobileResponsive: true,
                        undefinedText: '-', //空数据的默认显示字符
                        striped: true, //斑马线
                        sortName: 'id', //默认排序列名
                        sortOrder: 'desc', //默认排序方式
                        columns: [{
                            field: 'id',
                            title: '编号',
                            align: 'center'
                        }, {
                            field: 'name',
                            title: '名字',
                            align: 'center'
                        }, {
                            field: 'sex',
                            title: '性别',
                            align: 'center',
                            formatter: function (value, row, index) {
                                switch (value) {
                                    case 'n':
                                        return '男';
                                        break;
                                    case  'y':
                                        return '女';
                                        break;
                                    default:
                                        return '';
                                        break;
                                }
                            }
                        }]

                    });
                })

    })
</script>
<div class="container">
    <a class="btn btn-default" href="#" role="button" id="button">Link</a>
    <table class="table" id="table">

    </table>
</div>




