<@app.html>
    <@app.head>
        <script>
            $(function() {
                $('#page_table').datagrid({
                    fit: true,
                    width: '100%',
                    height: '100%',
                    striped: true,
                    pagination: true,
                    url: "${contextPath}/security/basic/shop_role/page.htm?agentId=${Session['SESSION_KEY_USER'].agentId}",
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
                            { field: 'checkbox', checkbox: true },
                            {
                                title: '运营商名称',
                                align: 'center',
                                field: 'agentName',
                                width: 60
                            },
                            {
                                title: '门店名称',
                                align: 'center',
                                field: 'shopName',
                                width: 60
                            },
                            {
                                title: '角色名称',
                                align: 'center',
                                field: 'roleName',
                                width: 60
                            },
                            {title: '备注', align: 'center', field: 'memo', width: 100},
                            {
                                title: '操作',
                                align: 'center',
                                field: 'id',
                                width: 60,
                                formatter: function(val, row) {
                                    var html ='';
                                        <#--<@app.has_oper perm_code='basic.AgentRole:view'>-->
                                            html += '<a href="javascript:view(ID)">查看</a>';
                                        <#--</@app.has_oper>-->
                                        <#--<@app.has_oper perm_code='basic.AgentRole:edit'>-->
                                            html += ' <a href="javascript:edit(ID)">修改</a>';
                                        <#--</@app.has_oper>-->
                                        <#--<@app.has_oper perm_code='basic.AgentRole:remove'>-->
                                            html += ' <a href="javascript:remove(ID)">删除</a>';
                                        <#--</@app.has_oper>-->
                                    return html.replace(/ID/g, row.id);
                                }
                            }
                        ]
                    ],
                    onLoadSuccess:function() {
                        $('#page_table').datagrid('clearChecked');
                        $('#page_table').datagrid('clearSelections');
                    }
                });
            });



            function reload() {
                var datagrid = $('#page_table');
                datagrid.datagrid('reload');
            }

            function query() {
                var datagrid = $('#page_table');
                var roleName = $('#role_name').val();
                datagrid.datagrid('options').queryParams = {
                    agentId: ${Session['SESSION_KEY_USER'].agentId},
                    roleName: roleName,
                    shopId: $('#shop_id').combotree('getValue')
                };
                datagrid.datagrid('load');
            }

            function add() {
                App.dialog.show({
                    css: 'width:480px;height:480px;overflow:visible;',
                    title: '新建',
                    href: "${contextPath}/security/basic/shop_role/add.htm",
                    event: {
                        onClose: function() {
                            reload();
                        }
                    }
                });
            }
            function edit(id) {
                App.dialog.show({
                    css: 'width:480px;height:480px;overflow:visible;',
                    title: '修改',
                    href: "${contextPath}/security/basic/shop_role/edit.htm?id=" + id,
                    event: {
                        onClose: function() {
                            var datagrid = $('#page_table');
                            datagrid.datagrid('reload');
                        },
                        onLoad: function() {
                        }
                    }
                });
            }
            function view(id) {
                App.dialog.show({
                    css: 'width:480px;height:480px;overflow:visible;',
                    title: '查看',
                    href: "${contextPath}/security/basic/shop_role/view.htm?id=" + id
                });
            }

            function remove(id) {
                $.messager.confirm('提示信息', '确认删除?', function(ok) {
                    if(ok) {
                        $.post('${contextPath}/security/basic/shop_role/delete.htm', {
                            id: id
                        }, function (json) {
                            if (json.success) {
                                $.messager.alert('info', '操作成功', 'info');
                                reload();
                            } else {
                                $.messager.alert('提示消息', json.message, 'info');
                            }
                        }, 'json');
                    }
                });
            }

        </script>
    </@app.head>

    <@app.body>

        <@app.container>
            <@app.banner/>

            <div class="main">
                <@app.menu/>

                <div class="content">
                    <div class="panel search">
                        <div class="float_right">
                            <button class="btn btn_yellow" onclick="query()">搜索</button>
                        </div>
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="60" align="right">门店：</td>
                                <td>
                                    <input name="shopId" id="shop_id" class="easyui-combotree" editable="false"
                                           style="width: 190px;height: 28px;"
                                           data-options="url:'${contextPath}/security/hdg/shop/tree.htm?agentId=${Session['SESSION_KEY_USER'].agentId}',
                                method:'get',
                                valueField:'id',
                                textField:'text',
                                editable:false,
                                multiple:false,
                                panelHeight:'200',
                                onClick: function(node) {
                                }
                            "
                                    >&nbsp;&nbsp;
                                </td>
                                <td align="right" width="80">角色名称：</td>
                                <td><input type="text" class="text" id="role_name"/></td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel grid_wrap">
                        <div class="toolbar clearfix">
                            <div class="float_right">
                                <#--<@app.has_oper perm_code='basic.AgentRole:add'>-->
                                    <button class="btn btn_green" onclick="add()">新建</button>
                                <#--</@app.has_oper>-->
                            </div>
                            <h3>门店角色</h3>
                        </div>
                        <div class="grid">
                            <table id="page_table"></table>
                        </div>
                    </div>
                </div>
            </div>
        </@app.container>
    </@app.body>
</@app.html>
