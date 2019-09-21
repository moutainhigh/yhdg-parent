<div class="popup_body">
    <div class="ui_table">
        <form>
            <input type="hidden" name="id" value="${(entity.id)!''}">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td width="90" align="right">运营商：</td>
                    <td>
                        <input name="agentId" id="agent_id" class="easyui-combotree" required="true"
                               editable="false" style="width: 195px; height: 28px;" readonly
                               data-options="url:'${contextPath}/security/basic/agent/tree.htm',
                                    method:'get',
                                    valueField:'id',
                                    textField:'text',
                                    editable:false,
                                    multiple:false,
                                    panelHeight:'200',
                                    onClick: function(node) {
                                        swich_shop();
                                    }" value="${(entity.agentId)!''}"
                        >
                    </td>
                </tr>
                <tr>
                    <td width="60" align="right">门店：</td>
                    <td>
                        <input name="shopId" id="shop_id" class="easyui-combotree" editable="false"
                               style="width: 195px;height: 28px;" required="true" readonly
                               data-options="url:'${contextPath}/security/hdg/shop/vehicle_tree.htm?agentId=${entity.agentId}&isVehicle=1',
                            method:'get',
                            valueField:'id',
                            textField:'text',
                            editable:false,
                            multiple:false,
                            panelHeight:'200',
                            onClick: function(node) {
                            }" value="${(entity.shopId)!''}">
                    </td>
                </tr>
                <tr>
                    <td width="90" align="right">套餐名称：</td>
                    <td>
                        <input name="settingName" readonly id="setting_name" value="${(entity.settingName)!''}" class="text easyui-validatebox" style="height: 28px;width: 185px;"  required="true"/>
                    </td>
                </tr>
                <tr>
                    <td width="90" align="right">车架号：</td>
                    <td><input id="vin_no" readonly class="text easyui-validatebox" name="vinNo" value="${(entity.vinNo)!''}" style="height: 28px;width: 185px;" maxlength="100" required="true"></td>
                </tr>
                <#if entity.category != 3>
                    <tr>
                        <td width="90">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;绑定电池：</td>
                    </tr>
                    <tr id="shop_store_vehicle_battery">
                        &nbsp;&nbsp;&nbsp;&nbsp;<#include '../shop_store_vehicle/shop_store_vehicle_battery.ftl'>
                    </tr>
                </#if>
                <tr>
                    <td width="90" align="right">车辆配置：</td>
                    <td><input class="text easyui-validatebox" id="vehicle_name" value="${(entity.vehicleName)!''}" readonly style="height: 28px;width: 185px;"></td>
                    <td width="90" align="right">车辆型号：</td>
                    <td><input class="text easyui-validatebox" id="model_name" value="${(entity.modelName)!''}" readonly style="height: 28px;width: 185px;"></td>
                    <input type="hidden" id="model_id" value="${(entity.modelId)!''}">
                </tr>
                <#if entity.category != 3>
                    <tr>
                        <td width="90" align="right">电池数量：</td>
                        <td><input class="text easyui-validatebox" name="batteryCount" value="${(entity.batteryCount)!''}" id="battery_count" readonly style="height: 28px;width: 185px;"></td>
                        <input type="hidden" class="text easyui-validatebox" name="priceSettingId" value="${(entity.priceSettingId)!''}" id="price_setting_id" style="height: 28px;width: 185px;">
                        <input type="hidden" class="text easyui-validatebox" name="category" value="${(entity.category)!''}" id="category" style="height: 28px;width: 185px;">
                    </tr>
                </#if>
                <input type="hidden" id="ids" name="ids">
            </table>
        </form>
    </div>
</div>
<div class="popup_btn"  style="margin-right: 5px;">
    <button class="btn btn_red ok">确定</button>
    <button class="btn btn_border close">关闭</button>
</div>
<script>

    function swich_shop() {
        var agentId = $('#agent_id').combotree('getValue');
        var shop = $('#shop_id');
        shop.combotree({
            url: "${contextPath}/security/hdg/shop/vehicle_tree.htm?agentId=" + agentId + "&isVehicle=1"
        });
        shop.combotree('reload');
    }

    //绑定的电池
    $.post('${contextPath}/security/zc/shop_store_vehicle/shop_store_vehicle_battery.htm', {
        storeVehicleId: ${(entity.id)!0}
    }, function (html) {
        $("#shop_store_vehicle_battery").html(html);
    }, 'html');

    (function() {
        var pid = '${pid}',
                win = $('#' + pid),
                form = win.find('form');

        win.find('button.ok').click(function() {
            if (${entity.category} != 3) {
                var batteryIds = $(".shop_store_vehicle_battery p");
                if (batteryIds.length != 0 && batteryIds.length != ${batteryCount}) {
                    $.messager.alert('提示信息', "电池数量不正确", 'info');
                    return false;
                }
                var ids = [];
                for (var j = 0; j < batteryIds.length; j++) {
                    ids.push(batteryIds[j].id);
                }
                $('#ids').val(ids);
            }
            form.form('submit', {
                url: '${contextPath}/security/zc/shop_store_vehicle/update.htm',
                success: function(text) {
                    var json = $.evalJSON(text);
                    <@app.json_jump/>
                    if(json.success) {
                        $.messager.alert('提示信息', '操作成功', 'info');
                        win.window('close');
                    } else {
                        $.messager.alert('提示信息', json.message, 'info');
                    }
                }
            });
        });
        win.find('button.close').click(function() {
            win.window('close');
        });


        win.find('input[name=settingName]').click(function() {
            selectPriceSetting();
        });

        function selectPriceSetting() {
            var shopId = $('#shop_id').combotree('getValue');
            if (shopId == "" || shopId == null) {
                $.messager.alert('提示信息',"请选择门店");
            }else {
                App.dialog.show({
                    css: 'width:826px;height:522px;overflow:visible;',
                    title: '选择套餐',
                    href: "${contextPath}/security/zc/shop_price_setting/select_shop_price_setting.htm?shopId="+shopId,
                    event: {
                        onClose: function() {
                        }
                    }
                });
            }
        }

        win.find('input[name=vinNo]').click(function() {
            selectVehicle();
        });

        function selectVehicle() {
            var agentId = $('#agent_id').combotree('getValue');
            var modelId = $('#model_id').val();
            if (agentId == "" || agentId == null) {
                $.messager.alert('提示信息',"请选择运营商");
            }else if (modelId == "" || modelId == null) {
                $.messager.alert('提示信息',"请选择套餐");
            } else {
                App.dialog.show({
                    css: 'width:826px;height:522px;overflow:visible;',
                    title: '选择车辆',
                    href: "${contextPath}/security/zc/vehicle/select_vehicle.htm?agentId="+agentId+"&modelId="+modelId,
                    event: {
                        onClose: function() {
                        }
                    }
                });
            }
        }
    })();
</script>