package cn.com.yusong.yhdg.appserver.service.basic;

import cn.com.yusong.yhdg.appserver.persistence.basic.PushMetaDataMapper;
import cn.com.yusong.yhdg.common.domain.basic.PushMetaData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PushMetaDataService {
    @Autowired
    PushMetaDataMapper pushMetaDataMapper;

    public void insert(PushMetaData metaData) {
        pushMetaDataMapper.insert(metaData);
    }
}
