package cn.com.yusong.yhdg.agentserver.persistence.hdg;


import cn.com.yusong.yhdg.common.domain.hdg.ExchangePriceTime;
import cn.com.yusong.yhdg.common.persistence.MasterMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ExchangePriceTimeMapper extends MasterMapper {
    List<ExchangePriceTime> findPageResult(ExchangePriceTime exchangePriceTime);
    ExchangePriceTime findByBatteryType(@Param("batteryType") int batteryType, @Param("agentId") int agentId);
    ExchangePriceTime find(Long id);
    int insert(ExchangePriceTime exchangePriceTime);
    int update(ExchangePriceTime exchangePriceTime);
    int delete(Long id);
    int findPageCount(ExchangePriceTime search);
}
