package cn.com.yusong.yhdg.agentserver.persistence.basic;

import cn.com.yusong.yhdg.common.domain.basic.PushMessageContent;
import cn.com.yusong.yhdg.common.persistence.MasterMapper;

public interface PushMessageContentMapper extends MasterMapper {
    PushMessageContent find(long id);
}
