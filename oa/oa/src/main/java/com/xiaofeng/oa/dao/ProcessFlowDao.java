package com.xiaofeng.oa.dao;

import com.xiaofeng.oa.entity.ProcessFlow;

import java.util.List;

public interface ProcessFlowDao {
    public void insert(ProcessFlow processFlow);
    public void update(ProcessFlow processFlow);
    public List<ProcessFlow> selectByFormId(Long formId);
}
