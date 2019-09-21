/**
 * Alipay.com Inc.
 * Copyright (c) 2004-2014 All Rights Reserved.
 */
package cn.com.yusong.yhdg.weixinserver.alipay.executor;

import cn.com.yusong.yhdg.common.domain.basic.Alipayfw;
import cn.com.yusong.yhdg.weixinserver.alipay.AlipayMsgBuildUtil;
import cn.com.yusong.yhdg.weixinserver.config.AppConfig;
import com.alipay.api.AlipayClient;
import net.sf.json.JSONObject;

/**
 * 普通进入服务窗事件处理器
 * 用户进入服务窗，可在此处理器处理开发者需要的业务逻辑
 * 
 * @author taixu.zqq
 * @version $Id: InAlipayEnterExecutor.java, v 0.1 2014年7月24日 下午7:58:25 taixu.zqq Exp $
 */
public class InAlipayEnterExecutor extends BaseExecutor implements ActionExecutor {


    public InAlipayEnterExecutor(Alipayfw alipayfw, AlipayClient alipayClient, JSONObject bizContent) {
        super(alipayfw, alipayClient, bizContent);
    }

    @Override
    public String execute() throws Exception {
        //自身业务处理,这里只是简单打印下
        //建议开发者自行处理采用异步方式，参见InAlipayChatTextExecutor
        System.out.println("欢迎光临！");

        // 同步返回ack响应
        return this.setResponse();
    }

    /**
     * 设置response返回数据
     * 
     * @return
     */
    private String setResponse() throws Exception {

        //取得发起请求的支付宝账号id
        String fromUserId = bizContent.getString("FromUserId");

        return AlipayMsgBuildUtil.buildBaseAckMsg(alipayfw.getAppId(), fromUserId);
    }
}