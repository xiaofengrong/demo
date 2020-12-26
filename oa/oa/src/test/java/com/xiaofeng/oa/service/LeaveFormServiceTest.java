package com.xiaofeng.oa.service;

import com.xiaofeng.oa.entity.LeaveForm;
import junit.framework.TestCase;
import org.junit.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class LeaveFormServiceTest extends TestCase {
    private LeaveFormService leaveFormService=new LeaveFormService();

    /**
     * 市场部员工请假单（72小时以上）
     * @throws ParseException
     */
    @Test
    public void testCreateLeaveForm1() throws ParseException {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHH");
        LeaveForm form=new LeaveForm();
        form.setEmployeeId(8l);
        form.setStartTime(sdf.parse("2020032608"));
        form.setEndTime(sdf.parse("2020040118"));
        form.setFormType(1);
        form.setReason("市场部员工请假单（72小时以上）");
        form.setCreateTime(new Date());
        LeaveForm savedForm=leaveFormService.createLeaveForm(form);
        System.out.println(savedForm.getFormId());
    }

    /**
     * 市场部员工请假单（72小时以下）
     * @throws ParseException
     */
    @Test
    public void testCreateLeaveForm2() throws ParseException {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHH");
        LeaveForm form=new LeaveForm();
        form.setEmployeeId(8l);
        form.setStartTime(sdf.parse("2020032608"));
        form.setEndTime(sdf.parse("2020032718"));
        form.setFormType(1);
        form.setReason("市场部员工请假单（72小时以下）");
        form.setCreateTime(new Date());
        LeaveForm savedForm=leaveFormService.createLeaveForm(form);
        System.out.println(savedForm.getFormId());
    }

    /**
     * 研发部经理请假申请
     * @throws ParseException
     */
    @Test
    public void testCreateLeaveForm3()  throws ParseException{
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHH");
        LeaveForm form=new LeaveForm();
        form.setEmployeeId(2l);
        form.setStartTime(sdf.parse("2020032608"));
        form.setEndTime(sdf.parse("2020040118"));
        form.setFormType(1);
        form.setReason("研发部经理请假申请");
        form.setCreateTime(new Date());
        LeaveForm savedForm=leaveFormService.createLeaveForm(form);
        System.out.println(savedForm.getFormId());
    }

    /**
     * 总经理请假申请
     * @throws ParseException
     */
    @Test
    public void testCreateLeaveForm4()  throws ParseException{
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHH");
        LeaveForm form=new LeaveForm();
        form.setEmployeeId(1l);
        form.setStartTime(sdf.parse("2020032608"));
        form.setEndTime(sdf.parse("2020040118"));
        form.setFormType(1);
        form.setReason("总经理请假申请");
        form.setCreateTime(new Date());
        LeaveForm savedForm=leaveFormService.createLeaveForm(form);
        System.out.println(savedForm.getFormId());
    }
    @Test
    public void testAudit1() {
        leaveFormService.audit(31l,2l,"approved","祝早日康复");
    }
    @Test
    public void testAudit2() {
        leaveFormService.audit(32l,2l,"refused","工期紧张，请勿拖延");
    }
    @Test
    public void testAudit3() {
        leaveFormService.audit(33l,1l,"approved","同意");
    }
}