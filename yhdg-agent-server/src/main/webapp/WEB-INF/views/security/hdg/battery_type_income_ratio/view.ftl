<div class="tab_item">
    <div class="ui_table">
        <form>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td align="right">运营商：</td>
                    <td>
                        <input name="agentId"  id="agent_id_${pid}" class="easyui-combotree" required="true" readonly
                               editable="false" style="width: 184px; height: 28px;"
                               data-options="url:'${contextPath}/security/basic/agent/tree.htm',
                                    method:'get',
                                    valueField:'id',
                                    textField:'text',
                                    editable:false,
                                    multiple:false,
                                    panelHeight:'200',
                                    onClick: function(node) {
                                    }"
                               value="${(entity.agentId)!''}"/>
                    </td>
                    <td align="right">电池类型：</td>
                    <td>
                        <input name="batteryType" id="battery_type_${pid}" class="easyui-combotree" editable="false"
                               style="width: 184px; height: 28px;"
                               url="${contextPath}/security/basic/agent_battery_type/tree.htm?agentId=${entity.agentId}"
                               value="${(entity.batteryType)!''}">
                    </td>
                </tr>
                <tr>
                    <td width="80" align="right">平台比例：</td>
                    <td>
                        <input type="text" class="text easyui-validatebox" maxlength="3" name="platformRatio" readonly value="${(entity.platformRatio)!''}"/>
                    </td>
                    <td width="80" align="right">运营商比例：</td>
                    <td>
                        <input type="text" class="text easyui-validatebox" maxlength="3" name="agentRatio" readonly value="${(entity.agentRatio)!''}"/>
                    </td>
                </tr>
                <tr>
                    <td width="80" align="right">省代比例：</td>
                    <td>
                        <input type="text" class="text easyui-validatebox" maxlength="3" name="provinceAgentRatio" readonly value="${(entity.provinceAgentRatio)!''}"/>
                    </td>
                    <td width="80" align="right">市代比例：</td>
                    <td>
                        <input type="text" class="text easyui-validatebox" maxlength="3" name="cityAgentRatio" readonly value="${(entity.cityAgentRatio)!''}"/>
                    </td>
                </tr>
                <tr>
                    <td width="80" align="right">启用扣除金额：</td>
                    <td>
                        <span class="radio_box">
                            <input type="radio" class="radio" readonly name="activePlatformDeduct" id="activePlatformDeduct_1" <#if entity.activePlatformDeduct?? && entity.activePlatformDeduct == 1>checked</#if> value="1"/><label for="activePlatformDeduct_1">启用</label>
                        </span>
                        <span class="radio_box">
                            <input type="radio" class="radio" readonly name="activePlatformDeduct" id="activePlatformDeduct_0" <#if entity.activePlatformDeduct?? && entity.activePlatformDeduct == 1><#else >checked</#if> value="0"/><label for="activePlatformDeduct_0">禁用</label>
                        </span>
                    </td>
                    <td width="80" align="right">运营商扣除：</td>
                    <td>
                        <input type="text" class="text easyui-validatebox" readonly maxlength="3" name="platformDeductMoney" value="${(entity.platformDeductMoney)!''}"/>
                    </td>
                </tr>
                <tr>
                    <td width="80" align="right">运营商扣除过期时间：</td>
                    <td><input type="text" class="text easyui-datetimebox" readonly editable="false" style="width:185px;height:28px " id="begin_time_${pid}" name="platformDeductExpireTime" value="${(entity.platformDeductExpireTime?string('yyyy-MM-dd HH:mm:ss'))!''}" ></td>
                    <td width="80" align="right" >租金周期：</td>
                    <td>
                        <select style="width:185px;" name="rentPeriodType" readonly >
                        <#list rentPeriodTypeEnum as e>
                            <option value="${e.getValue()}" <#if (entity.rentPeriodType == e.value)> selected="selected" </#if>>${e.getName()}</option>
                        </#list>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td width="80" align="right">每个周期收多少钱：</td>
                    <td>
                        <input type="text" class="text easyui-validatebox" readonly maxlength="3" name="rentPeriodMoney" value="${(entity.rentPeriodMoney)!''}"/>
                    </td>
                    <td width="80" align="right">租金周期过期时间：</td>
                    <td><input type="text" class="text easyui-datetimebox" readonly editable="false" style="width:185px;height:28px " id="end_time_${pid}" name="rentExpireTime" value="${(entity.rentExpireTime?string('yyyy-MM-dd HH:mm:ss'))!''}"></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div class="popup_btn">
    <button class="btn btn_border close">关闭</button>
</div>
<script>
    (function() {
        var pid = '${pid}', win = $('#' + pid), form = win.find('form');
        win.find('button.close').click(function() {
            win.window('close');
        });
    })();
</script>