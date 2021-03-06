package cn.com.yusong.yhdg.common.protocol.msg_tbit;

public class Msg_WEB_12 extends TextMessage {
    public Integer code;

    @Override
    public String getMsgCode() {
        return MsgCode.MSG_WEB_12;
    }

    @Override
    protected void readBody(String[] array) {
        int index = 0;
        time = array[index++];
        terminalType = array[index++];
        version = array[index++];
        vinNo = array[index++];
        msgCode =  array[index++];
        code =  Integer.parseInt(array[index++]);
    }

    @Override
    protected void writeBody(StringBuilder body) {
        body.append(time);
        body.append(SPLIT);
        body.append(terminalType);
        body.append(SPLIT);
        body.append(version);
        body.append(SPLIT);
        body.append(vinNo);
        body.append(SPLIT);
        body.append(getMsgCode());
        body.append(SPLIT);
        body.append(code);

    }
}
