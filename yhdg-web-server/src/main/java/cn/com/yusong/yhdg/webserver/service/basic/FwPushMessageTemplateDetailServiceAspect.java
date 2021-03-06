package cn.com.yusong.yhdg.webserver.service.basic;

import cn.com.yusong.yhdg.common.constant.CacheKey;
import cn.com.yusong.yhdg.common.domain.basic.FwPushMessageTemplateDetail;
import cn.com.yusong.yhdg.common.domain.basic.MpPushMessageTemplateDetail;
import cn.com.yusong.yhdg.common.tool.memcached.MemCachedClient;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class FwPushMessageTemplateDetailServiceAspect {
    @Autowired
    MemCachedClient memCachedClient;

    @Pointcut("execution(* cn.com.yusong.yhdg.webserver.service.basic.FwPushMessageTemplateDetailService.update(..))")
    private void update() {}

    @Around("update()")
    public Object update(ProceedingJoinPoint joinPoint) throws Throwable {
        FwPushMessageTemplateDetail detail = (FwPushMessageTemplateDetail) joinPoint.getArgs()[0];
        Object result = joinPoint.proceed();

        memCachedClient.delete(CacheKey.key(CacheKey.K_TEMPLATE_ID_V_FW_PUSH_MESSAGE_TEMPLATE_DETAIL_LIST, detail.getAlipayfwId(), detail.getTemplateId()));
        return result;
    }
}
