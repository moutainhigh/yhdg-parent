package cn.com.yusong.yhdg.agentserver.service.basic;


import cn.com.yusong.yhdg.common.domain.basic.AgentDayInOutMoney;
import cn.com.yusong.yhdg.common.domain.hdg.AgentDayStats;
import cn.com.yusong.yhdg.common.entity.pagination.Page;
import cn.com.yusong.yhdg.agentserver.persistence.basic.AgentDayInOutMoneyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AgentDayInOutMoneyService {
    @Autowired
    AgentDayInOutMoneyMapper agentDayInOutMoneyMapper;

    public Page findPage(AgentDayInOutMoney search) {
        Page page = search.buildPage();
        page.setTotalItems(agentDayInOutMoneyMapper.findPageCount(search));
        search.setBeginIndex(page.getOffset());
        page.setResult(agentDayInOutMoneyMapper.findPageResult(search));
        return page;
    }

}
