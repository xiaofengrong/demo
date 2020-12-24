package com.xiaofeng.oa.dao;

import com.xiaofeng.oa.entity.Node;
import com.xiaofeng.oa.utils.MybatisUtils;
import java.util.List;

public class RbacDao {
    public List<Node> selectNodeByUserId(Long userId){
        return  (List)MybatisUtils.executeQuery(sqlSession->sqlSession.selectList("rbacmapper.selectNodeByUserId",userId));

    }
}
