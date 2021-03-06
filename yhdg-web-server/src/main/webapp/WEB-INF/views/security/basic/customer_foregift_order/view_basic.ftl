<div class="tab_item" style="display:block;">
    <div class="ui_table">
        <form>
            <input type="hidden" name="id" value="${(entity.id)!''}">
            <table cellpadding="0" cellspacing="0" style="width: 80%;">
                <tr>
                    <td align="right">订单编号：</td>
                    <td><input class="text easyui-validatebox" readonly="readonly" name="id" value="${(entity.id)!''}" style="width:182px;height:28px " required="required" ></td>
                    <td width="70" align="right" valign="top" rowspan="2" style="padding-top:10px;">退款凭证照片：</td>
                    <td rowspan="2">
                        <div class="portrait">
                            <a href="javascript:void(0)"><img id="image_${pid}" src="<#if entity.refundPhoto?? && entity.refundPhoto?length gt 0>${staticUrl}${entity.refundPhoto}<#else>${app.imagePath}/user.jpg</#if>" /></a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="right">金额：</td>
                    <td><input class="text easyui-validatebox" name="money" readonly="readonly" value="<#if (entity.money)??>${((entity.money) / 100 + "元")!''}<#else></#if>" style="width:182px;height:28px " required="required" ></td>
                </tr>
                <tr>
                    <td align="right">客户姓名：</td>
                    <td><input class="text easyui-validatebox" name="customerFullname" readonly="readonly" value="${(entity.customerFullname)!''}" style="width:182px;height:28px " required="required" ></td>
                    <td width="110" align="right">客户手机号：</td>
                    <td><input class="text easyui-validatebox" name="customerMobile" readonly="readonly" value="${(entity.customerMobile)!''}" style="width:182px;height:28px " required="required" ></td>
                </tr>
                <tr>
                    <td align="right">支付类型：</td>
                    <td>
                        <select name="payType" id="pay_type_${pid}" disabled="disabled" style="width: 195px; height: 28px;">
                        <#list payTypeEnum as payType>
                            <option value="${payType.getValue()}"
                                    <#if entity.payType==payType.getValue()>selected="selected"</#if>>${payType.getName()}</option>
                        </#list>
                        </select>
                    </td>
                    <td width="100" align="right">创建时间：</td>
                    <td>
                        <input type="text" class="text easyui-datetimebox"style="width:195px;height:28px " readonly="readonly"
                               value="<#if (entity.createTime)?? >${app.format_date_time(entity.createTime)}</#if>" name="createTime">
                    </td>
                </tr>
                <tr>
                    <td align="right">状态：</td>
                    <td>
                        <select name="status" id="status_${pid}" disabled="disabled" style="width: 195px; height: 28px;">
                            <#list statusEnum as status>
                                <option value="${status.getValue()}"
                                        <#if entity.status==status.getValue()>selected="selected"</#if>>${status.getName()}</option>
                            </#list>
                        </select>
                    </td>
                </tr>
                <#if entity.refundMoney??>
                <tr>
                    <td align="right">申请退款时间：</td>
                    <td>
                        <input type="text" class="text easyui-datetimebox"style="width:195px;height:28px " readonly="readonly"
                               value="<#if (entity.applyRefundTime)?? >${app.format_date_time(entity.applyRefundTime)}</#if>" name="applyRefundTime">
                    </td>
                    <td align="right">退款时间：</td>
                    <td>
                        <input type="text" class="text easyui-datetimebox"style="width:195px;height:28px " readonly="readonly"
                               value="<#if (entity.refundTime)?? >${app.format_date_time(entity.refundTime)}</#if>" name="refundTime">
                    </td>
                </tr>
                <tr>
                    <td align="right">退款人：</td>
                    <td><input id="duration" class="text easyui-validatebox" readonly="readonly" name="refundOperator" value="${(entity.refundOperator)!''}" style="width:182px;height:28px " ></td>
                    <td align="right">退款金额：</td>
                    <td><input type="text" class="text" style="width:182px;height:28px " readonly="readonly" name="refundMoney" value="<#if (entity.refundMoney)??>${((entity.refundMoney) / 100 + "元")!''}<#else></#if>"/></td>
                </tr>
                <tr>
                    <td width="100" align="right">处理时间：</td>
                    <td>
                        <input type="text" class="text easyui-datetimebox"style="width:195px;height:28px " readonly="readonly"
                               value="<#if (entity.handleTime)?? >${app.format_date_time(entity.handleTime)}</#if>" name="handleTime">
                    </td>
                </tr>
                </#if>
                <tr>
                    <td align="right" valign="top" style="padding-top:10px;">备注：</td>
                    <td colspan="3"><textarea style="width:500px;" maxlength="20" readonly="readonly" name="memo">${(entity.memo)!''}</textarea></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<script>
    (function() {
        var win = $('#${pid}');
        var ok = function() {
            var success = true;
            return success;
        };
        win.data('ok', ok);
    })();

    function preview(path) {
        App.dialog.show({
            options:'maximized:true',
            title: '查看',
            href: "${contextPath}/security/main/preview.htm?path=" + path
        });
    }

</script>






