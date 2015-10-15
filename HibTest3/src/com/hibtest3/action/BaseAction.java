package com.hibtest3.action;

import com.hibtest3.biz.ServiceManager;
import com.hibtest3.entity.UserInfo;
import com.opensymphony.xwork2.ActionSupport;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * Created by Administrator on 2015/9/23.
 */
public class BaseAction extends ActionSupport implements org.apache.struts2.interceptor.ServletRequestAware,org.apache.struts2.interceptor.ServletResponseAware {
    protected ServiceManager serviceManager;
    protected UserInfo userInfo;
    protected String result;

    protected Map<String,String> cookie;
    protected HttpServletRequest request;
    protected HttpServletResponse response;
    public void setServletResponse(HttpServletResponse response){
        this.response=response;
    }
    public void setServletRequest(HttpServletRequest request){
        this.request=request;
    }
    public String getResult(){
        return result;
    }
    public void setResult(String result){
        this.result=result;
    }
    public void setServiceManager(ServiceManager serviceManager){
        this.serviceManager=serviceManager;
    }
    public void setUserInfo(UserInfo userInfo){
        this.userInfo=userInfo;
    }
}
