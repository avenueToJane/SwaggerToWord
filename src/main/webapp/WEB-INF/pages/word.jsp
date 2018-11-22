<%-- text/html：正常的html显示  application/msword：html页面直接转word--%>
<%@ page contentType="application/msword" pageEncoding="UTF-8" language="java" %>
<%--<%@page contentType="text/html" pageEncoding="UTF-8" language="java" %>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>tool</title>
        <style type="text/css">
            .bg {
            background-color: rgb(84, 127, 177);
            }

            tr {
            height: 20px;
            font-size: 12px;
            }

            .specialHeight {
            height: 40px;
            }
        </style>
    </head>
    <body>
        <div style="width:800px; margin: 0 auto">
            <c:forEach items="${table}" varStatus="flag" var="t">

                <c:choose>
                    <c:when test="${table[flag.index-1].title.equals(t.title) }"> </c:when>
                    <c:otherwise><h2>${t.title}</h2> <%--这个是类的说明--%></c:otherwise>
                </c:choose>
                <h3>${t.tag}</h3>   <%--这个是每个请求的说明，方便生成文档后进行整理--%>
                <table border="1" cellspacing="0" cellpadding="0" width="100%">

                    <tr>
                        <td>接口名称</td>
                        <td colspan="4">${t.tag}</td>
                    </tr>
                    <tr>
                        <td>接口路径</td>
                        <td colspan="4">${t.url}</td>
                    </tr>
                    <tr>
                        <td>请求方式</td>
                        <td colspan="4">${t.requestType}</td>
                    </tr>
                    <tr>
                        <td>请求类型</td>
                        <td colspan="4">${t.requestForm}</td>
                    </tr>
                    <tr>
                        <td>返回类型</td>
                        <td colspan="4">${t.responseForm}</td>
                    </tr>
                    <tr>
                        <td colspan="5"><h4>请求参数列表</h4></td>
                    </tr>
                    <tr class="bg" align="center">
                        <td>中文名称</td>
                        <td>参数名称</td>
                        <td>数据类型</td>
                            <%--<td>参数类型</td>--%>
                        <td>是否必填</td>
                        <td>说明</td>
                    </tr>
                    <tr  align="center">
                        <td>渠道编码</td>
                        <td>channelCode</td>
                        <td>String</td>
                        <td>Y</td>
                        <td>渠道编码channelCode固定为IVR</td>
                    </tr>

                    <tr  align="center">
                        <td>省份编码</td>
                        <td>regionCode</td>
                        <td>String</td>
                        <td>Y</td>
                        <td>省份编码regionCode固定为HA</td>
                    </tr>


                    <tr  align="center">
                        <td>手机号码</td>
                        <td>telnum</td>
                        <td>String</td>
                        <td>Y</td>
                        <td>telnum不能为空</td>
                    </tr>
                    <tr  align="center">
                        <td>一通电话唯一标识</td>
                        <td>callId</td>
                        <td>String</td>
                        <td>Y</td>
                        <td>callId不能为空</td>
                    </tr>

                    <tr  align="center">
                        <td>扩展参数01</td>
                        <td>extList</td>
                        <td>Object</td>
                        <td>N</td>
                        <td>扩展参数List</td>
                    </tr>
                    <c:if test="${t.title .equals(\"tts-template-controller\") }">
                        <tr  align="center">
                            <td>模板编码</td>
                            <td>templateCode</td>
                            <td>String</td>
                            <td>Y</td>
                            <td>模板编号</td>
                        </tr></c:if>
                    <c:if test="${t.title .equals(\"sms-template-controller\") }">
                        <tr  align="center">
                            <td>模板编码</td>
                            <td>templateCode</td>
                            <td>String</td>
                            <td>Y</td>
                            <td>模板编号</td>
                        </tr>
                    </c:if>


                    <c:forEach items="${t.requestList}" var="req">
                        <tr align="center">
                            <td>扩展参数02</td>
                            <td>ext</td>
                            <td>${req.type}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${req.remark.equals(\"requestDto\") }">N</c:when>
                                    <c:when test="${req.remark.equals(\"requestTemplateDto\") }">N</c:when>
                                    <c:otherwise>Y</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${req.remark.equals(\"requestDto\") }">扩展参数</c:when>
                                    <c:when test="${req.remark.equals(\"requestTemplateDto\") }">扩展参数</c:when>
                                    <c:otherwise>${req.remark}</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="5"><h4>响应参数列表</h4></td>
                    </tr>
                    <tr class="bg" align="center">
                        <td>中文名称</td>
                        <td>参数名称</td>
                        <td>数据类型</td>
                        <td colspan="4">说明</td>
                    </tr>
                    <c:choose>
                        <c:when test="${t.title .equals(\"tts-template-controller\") }">
                            <tr  align="center">
                                <td>返回状态码</td>
                                <td>sendCode</td>
                                <td>String</td>
                                <td colspan="4">下发短信返回状态码：1失败0成功</td>
                            </tr>
                            <tr  align="center">
                                <td>播报内容</td>
                                <td>ttsContent</td>
                                <td>String</td>
                                <td colspan="4">播报语音内容</td>
                            </tr>
                            <tr  align="center">
                                <td>模版内容</td>
                                <td>templateContent</td>
                                <td>String</td>
                                <td colspan="4">需要动态修改的模版内容</td>
                            </tr>
                            <tr  align="center">
                                <td>结果描述</td>
                                <td>sendMsg</td>
                                <td>String</td>
                                <td colspan="4">返回结果描述</td>
                            </tr>
                        </c:when>
                        <c:when test="${t.title .equals(\"sms-template-controller\") }">
                            <tr  align="center">
                                <td>返回状态码</td>
                                <td>sendCode</td>
                                <td>String</td>
                                <td colspan="4">下发短信返回状态码：1失败0成功</td>
                            </tr>
                            <tr  align="center">
                                <td>短信内容</td>
                                <td>smsContent</td>
                                <td>String</td>
                                <td colspan="4">下发短信内容</td>
                            </tr>
                            <tr  align="center">
                                <td>模版内容</td>
                                <td>templateContent</td>
                                <td>String</td>
                                <td colspan="4">需要动态修改的模版内容</td>
                            </tr>
                            <tr  align="center">
                                <td>结果描述</td>
                                <td>sendMsg</td>
                                <td>String</td>
                                <td colspan="4">返回结果描述</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr  align="center">
                                <td>结果标识</td>
                                <td>flage</td>
                                <td>String</td>
                                <td colspan="4">true：是；false：否</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>

                    <tr class="bg">
                        <td colspan="5">报文示例</td>
                    </tr>
                    <tr class="specialHeight">
                        <td class="bg">请求报文</td>
                        <td colspan="4">

                            <c:choose>
                                <c:when test="${t.title .equals(\"sms-template-controller\")}">
                                    {<br/>
                                    "callId": "string",<br/>
                                    "channelCode": "IVR",<br/>
                                    "ext": {},<br/>
                                    "extList": {},<br/>
                                    "regionCode": "HA",<br/>
                                    "telnum": "14784201630",<br/>
                                    "templateCode": "string"<br/>
                                    }
                                </c:when>
                                <c:when test="${t.title .equals(\"tts-template-controller\") }">
                                    {<br/>
                                    "callId": "string",<br/>
                                    "channelCode": "IVR",<br/>
                                    "ext": {},<br/>
                                    "extList": {},<br/>
                                    "regionCode": "HA",<br/>
                                    "telnum": "14784201630",<br/>
                                    "templateCode": "string"<br/>
                                    }
                                </c:when>

                                <c:otherwise>
                                    {<br/>
                                    "callId": "string",<br/>
                                    "channelCode": "IVR",<br/>
                                    "ext": {},<br/>
                                    "extList": {},<br/>
                                    "regionCode": "HA",<br/>
                                    "telnum": "14784201630"<br/>
                                    }

                                </c:otherwise>
                            </c:choose>

                        </td>
                    </tr>
                    <tr class="specialHeight">
                        <td class="bg">响应报文</td>
                        <td colspan="4">
                            <c:choose>
                                <c:when test="${t.title .equals(\"sms-template-controller\")}">
                                    {<br/>
                                    "returnCode": 0,<br/>
                                    "returnMessage": "",<br/>
                                    "bean": {<br/>
                                    "ttsContent": "拼接后的模板",<br/>
                                    "sendCode": "0",<br/>
                                    "templateContent": "拼接前的模板",<br/>
                                    "sendMsg": "话术模板整合成功"<br/>
                                    },<br/>
                                    "beans": [],<br/>
                                    "object": {}
                                    }
                                </c:when>
                                <c:when test="${t.title .equals(\"tts-template-controller\") }">
                                    {<br/>
                                    "returnCode": 0,<br/>
                                    "returnMessage": "",<br/>
                                    "bean": {<br/>
                                    "ttsContent": "拼接后的模板",<br/>
                                    "sendCode": "0",<br/>
                                    "templateContent": "拼接前的模板",<br/>
                                    "sendMsg": "话术模板整合成功"<br/>
                                    },<br/>
                                    "beans": [],<br/>
                                    "object": {}
                                    }
                                </c:when>
                                <c:otherwise>
                                    {<br/>
                                    "returnCode": 0,<br/>
                                    "returnMessage": "",<br/>
                                    "bean": {<br/>
                                    "flage": "false"<br/>
                                    },<br/>
                                    "beans": [],<br/>
                                    "object": {}<br/>
                                    }
                                </c:otherwise>
                            </c:choose>


                        </td>
                    </tr>
                </table>
                <br>
            </c:forEach>
        </div>
    </body>
</html>