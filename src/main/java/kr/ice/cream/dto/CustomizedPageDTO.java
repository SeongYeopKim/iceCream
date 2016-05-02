package kr.ice.cream.dto;

import java.util.List;

/**
 * Created by Administrator on 2015-07-16.
 */
public class CustomizedPageDTO {

    private int perpage=10;     // 페이지당 보여줄 갯수
    private int curpage;
    private int totalCount;
    private List<OrderItemlistDTO> list;

    public List<OrderItemlistDTO> getList() {
        return list;
    }

    public void setList(List<OrderItemlistDTO> list) {
        this.list = list;
    }

    public int getPerpage() {
        return perpage;
    }

    public void setPerpage(int perpage) {
        this.perpage = perpage;
    }

    public int getCurpage() {
        return curpage;
    }

    public void setCurpage(int curpage) {
        this.curpage = curpage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }
}
