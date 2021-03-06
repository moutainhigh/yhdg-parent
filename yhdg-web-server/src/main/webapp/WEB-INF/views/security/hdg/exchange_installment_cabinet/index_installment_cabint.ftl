<div class="popup_body">
    <div class="search">
        <h4>
            <div>
                换电柜编号：
                <input style="width: 100px" class="text" id="code_${pid}" type="text">&nbsp;&nbsp;
                <button class="btn btn_yellow" id="query_${pid}">搜索</button>
            </div>
        </h4>
    </div>
    <div style="width:700px; height:310px; padding-top: 6px;">
        <table id="page_table_${pid}">
        </table>
    </div>
</div>
<div class="popup_btn">
    <button class="btn btn_border" id="close_${pid}">关闭</button>
</div>

    <script>
        (function() {
            var datagrid = $('#page_table_${pid}');
            datagrid.datagrid({
                fit: true,
                width: '100%',
                height: '100%',
                striped: true,
                pagination: true,
                url: "${contextPath}/security/hdg/exchange_installment_cabinet/page_installment_cabint.htm?settingId="+${(settingId)!''},
                fitColumns: true,
                pageSize: 10,
                pageList: [10, 50, 100],
                idField: 'id',
                singleSelect: true,
                selectOnCheck: false,
                checkOnSelect: false,
                autoRowHeight: false,
                rowStyler: gridRowStyler,
                columns: [
                    [
                        {
                            title: '换电柜编号',
                            align: 'center',
                            field: 'id',
                            width: 180
                        },
                        {
                            title: '换电柜名称',
                            align: 'center',
                            field: 'cabinetName',
                            width: 180
                        },
                        {
                            title: '所属运营商',
                            align: 'center',
                            field: 'version',
                            width: 180
                        },
                        {
                            title: '启用/在线',
                            align: 'center',
                            field: 'activeStatus',
                            width: 40,
                            formatter: function (val, row) {
                                var activeStatus = row.activeStatus == 1 ? '是' : '否';
                                var isOnline = row.isOnline == 1 ? '<a style="color: #00FF00;">是</a>' : '<a style="color: #ff0000;">否</a>';
                                return activeStatus + "/" + isOnline;
                            }
                        }
                    ]
                ],
                onLoadSuccess:function() {
                    datagrid.datagrid('clearChecked');
                    datagrid.datagrid('clearSelections');
                }
            });
            $('#query_${pid}').click(function() {
                datagrid.datagrid('options').queryParams = {
                    id: $('#code_${pid}').val()
                };
                datagrid.datagrid('load');
            });
            $('#close_${pid}').click(function() {
                $('#${pid}').window('close');
            });

        })();

    </script>