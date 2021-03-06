package cn.com.yusong.yhdg.agentserver.service.yms;

import cn.com.yusong.yhdg.agentserver.persistence.yms.PublishedPlaylistDetailMapper;
import cn.com.yusong.yhdg.common.domain.yms.PublishedPlaylistDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PublishedPlaylistDetailService {

    @Autowired
    PublishedPlaylistDetailMapper publishedPlaylistDetailMapper;

    public List<PublishedPlaylistDetail> findByPlaylist(long publishedPlaylistId) {
        return publishedPlaylistDetailMapper.findByPlaylist(publishedPlaylistId);
    }

    public PublishedPlaylistDetail find(long id) {
        return publishedPlaylistDetailMapper.find(id);
    }
}
