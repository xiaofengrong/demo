package com.xiaofeng.oa.dao;

import com.xiaofeng.oa.entity.LeaveForm;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface LeaveFormDao {
    public void insert(LeaveForm form);

    public List<Map> selectByParams(@Param("pf_state") String pfState, @Param("pf_operator_id") Long operatorId);

    //   审批流程
    public LeaveForm selectByFormId(Long formId);
    public void update(LeaveForm leaveForm);
}
