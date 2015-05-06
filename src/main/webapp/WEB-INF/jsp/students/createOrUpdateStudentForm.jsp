<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <c:choose>
        <c:when test="${student['new']}">
            <c:set var="method" value="post"/>
            <spring:url value="/students/new" htmlEscape="true" var="action"/>
        </c:when>
        <c:otherwise>
            <c:set var="method" value="put"/>
            <spring:url value="/students/${studentId}/edit" htmlEscape="true" var="action"/>
        </c:otherwise>
    </c:choose>

    <jsp:include page="../fragments/jQueryLib.jsp"/>

    <script>
        $(function () {
            $("#birthDate").datepicker({ dateFormat: 'dd.mm.yy'});
        });
    </script>

</head>
<body>

<div id="wrapper-login">

    <h1>Student</h1>

    <form:form modelAttribute="student" method="${method}" action="${action}">
        <table class="horiz">

            <tr>
                <td><form:label path="firstName">First name:</form:label></td>
                <td><form:input path="firstName"/><form:errors path="firstName" cssStyle="color:red;"
                                                               cssclass="error"/></td>
            </tr>

            <tr>
                <td><form:label path="middleName">Middle name:</form:label></td>
                <td><form:input path="middleName"/><form:errors path="middleName" cssStyle="color:red;"
                                                                cssclass="error"/></td>
            </tr>

            <tr>
                <td><form:label path="lastName">Last name:</form:label></td>
                <td><form:input path="lastName"/><form:errors path="lastName" cssStyle="color:red;"
                                                              cssclass="error"/></td>
            </tr>
            <tr>
                <td><form:label path="dateOfBirth">Date of birth:</form:label></td>
                <td><form:input path="dateOfBirth" id="birthDate"/><form:errors path="dateOfBirth" cssStyle="color:red;"
                                                                 cssclass="error"/></td>
            </tr>
            <tr>
                <td><form:label path="gender">Gender:</form:label></td>
                <td><form:radiobutton path="gender" value="MALE"/>Male
                    <form:radiobutton path="gender" value="FEMALE"/>Female<form:errors path="gender" cssStyle="color:red;"
                                                                 cssclass="error"/></td>
            </tr>


        </table>

        <hr>

        <input type="submit" value="Save"/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form:form>

</div>

</body>
</html>