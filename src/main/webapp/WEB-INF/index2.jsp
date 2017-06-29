<%@  page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/boot/css/bootstrap.min.css" rel="stylesheet">
<script src="/static/jquery/jquery-2.2.4.min.js"></script>
<script src="/boot/js/bootstrap.min.js"></script>
<script  >
    $(function () {
        $("#button").click(function(){
            $.ajax({
                type: "POST",
                url:"../hello/world",
                success: function(msg){
                    //这里的msg是json对象，不是json字符串。
                    $('#table').bootstrapTable('load',msg);
                }
            });
        });
    })
</script>
<div class="container">
    <a class="btn btn-default" href="#" role="button" id="button">Link</a>
    <table class="table" id="table">

    </table>
</div>




