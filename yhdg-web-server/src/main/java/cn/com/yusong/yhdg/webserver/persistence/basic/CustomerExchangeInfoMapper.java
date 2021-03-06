package cn.com.yusong.yhdg.webserver.persistence.basic;

import cn.com.yusong.yhdg.common.domain.basic.CustomerExchangeInfo;
import cn.com.yusong.yhdg.common.persistence.MasterMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerExchangeInfoMapper extends MasterMapper {
    CustomerExchangeInfo find(@Param("id") long id);

    int updateCustomerInfo(@Param("customerId")Long customerId,@Param("newCustomerId")Long newCustomerId);

    int clearBatteryForegiftOrderId(@Param("id") long id, @Param("statusList") List<Integer> statusList);

    int delete(@Param("id") long id);
}
