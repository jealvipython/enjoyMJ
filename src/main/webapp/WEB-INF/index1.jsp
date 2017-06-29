<%@  page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/static/bootstrap/css/bootstrap.css">
<!-- 面包屑 -->
<div id="container" >
    <!-- ibox start -->
    <div class="ibox">
        <div class="ibox-content">
            <div class="row">
            </div>
            <table v-el:data-table id="dataTable" width="100%"
                   class="table table-striped table-bordered table-hover">
            </table>
        </div>
    </div>
    <!-- ibox end -->
</div>
<!-- container end-->
<!-- 新 Bootstrap 核心 CSS 文件 -->
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/static/jquery/jquery-2.2.4.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/static/bootstrap/js/bootstrap.js"></script>
<script src="/static/bootstrap-table/bootstrap-table.js"></script>
<script src="/static/vue/vue.min.js"></script>
<script  >
        new Vue({
            el:'#container',
            data:{
                $dataTable: null,
            },
            methods:{
                drawTable: function () {
                    var self = this;
                    self.$dataTable = $(this.$els.dataTable).bootstrapTable({
                        url: '/hello/world',
                        method: 'get',
                        dataType: 'json',
                        cache: false, //去缓存
                        pagination: true, //是否分页
                        sidePagination: 'server', //服务端分页
                        //queryParams: function (params) {
                            // 将table 参数与搜索表单参数合并
                          //  return _.extend({}, params, self.form);
                        //},
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
                        }, {
                            field: '', //将id作为排序时会和将id作为操作field内容冲突，导致无法排序
                            title: "操作",
                            align: 'center',
                            formatter: function (value, row, index) {
                                var fragment = '';
                                    fragment += ('<button data-handle="operate-edit" data-id="' + row.id + '" type="button" class="m-r-xs btn btn-xs btn-info">编辑</button>');
                                    fragment += ('<button data-handle="operate-delete" data-index="' + index + '" data-id="' + row.id + '" type="button" class="m-r-xs btn btn-xs btn-danger">删除</button>');
                                return fragment;
                            }
                        }]
                    });
                    self.$dataTable.on('click', '[data-handle="operate-edit"]', function (e) {
                        var id = $(this).data('id');
                        self.$http.get('/api/dict/' + id).then(function (res) {
                            if (res.data.code == 1) {
                                var org = res.data.data;

                                self.showModel(org, true);

                            }
                        });
                    });
                    self.$dataTable.on('click', '[data-handle="operate-delete"]', function (e) {
                        var id = $(this).data('id');
                        swal({
                            title: '删除字典',
                            text: '确定删除这个字典吗？',
                            type: 'info',
                            confirmButtonText: '确定',
                            cancelButtonText: '取消',
                            showCancelButton: true,
                            showConfirmButton: true,
                            showLoaderOnConfirm: true,
                            confirmButtonColor: '#ed5565',
                            closeOnConfirm: false
                        }, function () {
                            self.$http.get('/api/dict/delete/' + id).then(function (res) {
                                if (res.data.code == 1) {
                                    self.$dataTable.bootstrapTable('refresh');
                                }
                            }).catch(function () {

                            }).finally(function () {
                                swal.close();
                            });
                        });
                        e.stopPropagation();
                    });
                }

            },
            ready: function () {
                this.drawTable()
            }


            })
</script>





