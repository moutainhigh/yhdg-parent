<div class="popup_body clearfix">
    <ul class="tab_nav" id="tab_container_${pid}">
        <li class="selected" url="${contextPath}/security/hdg/charge_packet_order_refund/view_basic.htm?id=${(entity.id)!''}&pid=${pid}">基本信息</li>
    <#if packetPeriodOrder.payType == 3 && entity.refundStatus == 2>
        <li url="${contextPath}/security/hdg/charge_packet_order_refund/alipay_pay_order_refund.htm?id=${(entity.id)!''}&pid=${pid}">支付宝退款订单</li>
    </#if>
    <#if packetPeriodOrder.payType == 4 && entity.refundStatus == 2>
        <li url="${contextPath}/security/hdg/charge_packet_order_refund/weixin_pay_order_refund.htm?id=${(entity.id)!''}&pid=${pid}">微信退款订单</li>
    </#if>
    </ul>
    <div class="tab_con">
        <div class="easyui-layout" style="width: 585px; height: 400px;">
            <div id="page_${pid}" data-options="region:'center', border:false, href:'${contextPath}/security/hdg/charge_packet_order_refund/view_basic.htm?id=${(entity.id)!''}&pid=${pid}'">
            </div>
        </div>
    </div>
</div>
<div class="popup_btn">
    <button class="btn btn_border close">关闭</button>
</div>
<script>
    (function() {
        var win = $('#${pid}');
        var list = $('#tab_container_${pid} li');
        list.click(function() {
            var me = $(this);
            if(me.attr('class') && me.attr('class').indexOf('selected') >= 0) {
                return;
            }
            var ok = win.data('ok')();
            if(ok) {
                list.removeClass('selected');
                me.addClass('selected');
                $('#page_${pid}').panel('refresh', me.attr('url'));
            }
        });
        win.find('.close').click(function() {
            win.window('close');
        });
    })();
</script>
