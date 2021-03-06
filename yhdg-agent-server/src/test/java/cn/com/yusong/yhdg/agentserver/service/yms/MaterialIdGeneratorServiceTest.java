package cn.com.yusong.yhdg.agentserver.service.yms;

import cn.com.yusong.yhdg.agentserver.service.BaseJunit4Test;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class MaterialIdGeneratorServiceTest extends BaseJunit4Test {

    @Autowired
    MaterialIdGeneratorService materialIdGeneratorService;

    @Test
    public void newId(){
        assertTrue(materialIdGeneratorService.newId() > 0);
    }
}
