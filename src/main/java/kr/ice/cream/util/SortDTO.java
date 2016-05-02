package kr.ice.cream.util;

import kr.ice.cream.dto.ItemtasteDTO;

import java.util.List;

/**
 * Created by Administrator on 2015-07-21.
 */
public class SortDTO {

    private int sort;
    private ItemtasteDTO taste;

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public ItemtasteDTO getTaste() {
        return taste;
    }

    public void setTaste(ItemtasteDTO taste) {
        this.taste = taste;
    }
}
