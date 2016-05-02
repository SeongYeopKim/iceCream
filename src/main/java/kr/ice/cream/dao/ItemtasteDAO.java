/*
* 작성일 : 2015. 7. 10.
* 작성자 : Administrator
*
* 설명
*/
package kr.ice.cream.dao;


import kr.ice.cream.dto.ItemtasteDTO;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ItemtasteDAO extends SqlSessionDaoSupport{

    public List<ItemtasteDTO> pullItemTaste(){
        return getSqlSession().selectList("itemtaste.pullItemTaste");
    }
}