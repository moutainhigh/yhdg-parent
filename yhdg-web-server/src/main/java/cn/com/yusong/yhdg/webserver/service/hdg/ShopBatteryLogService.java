package cn.com.yusong.yhdg.webserver.service.hdg;


import cn.com.yusong.yhdg.common.domain.hdg.ShopBatteryLog;
import cn.com.yusong.yhdg.common.entity.pagination.Page;
import cn.com.yusong.yhdg.webserver.persistence.hdg.ShopBatteryLogMapper;
import cn.com.yusong.yhdg.webserver.service.AbstractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopBatteryLogService extends AbstractService{
    @Autowired
    ShopBatteryLogMapper shopBatteryLogMapper;

    public Page findPage(ShopBatteryLog search) {
        Page page = search.buildPage();
        page.setTotalItems(shopBatteryLogMapper.findPageCount(search));
        search.setBeginIndex(page.getOffset());
        List<ShopBatteryLog> shopBatteryLogs = shopBatteryLogMapper.findPageResult(search);
        page.setResult(shopBatteryLogs);
        return page;
    }

}
