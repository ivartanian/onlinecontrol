<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html lang="en">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <spring:url value="/webjars/jquery/2.1.3/jquery.js" var="jQuery"/>
    <script src="${jQuery}"></script>

    <jsp:include page="../fragments/datatablesLib.jsp"/>

    <script>
        $(document).ready(function() {
            var table = $('#roles').DataTable();
        } );
    </script>

</head>
<body>
<div>

    <h2>Выбрать роль</h2>

    <table id="roles" class="display" cellspacing="0" width="100%">
        <thead>
        <tr>
            <th>Выбрать роль</th>
            <th>Имя</th>
            <th>Описание</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="role" items="${roles}">
            <tr>
                <td>
                    <spring:url value="/users/${user.id}/roles/${role.id}/add" htmlEscape="true" var="action"/>
                    <form:form method="post" action="${action}">
                        <p class="submit"><input type="submit" value="Добавить"/></p>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form:form>
                </td>
                <td>
                    <c:out value="${role.name}"/>
                </td>
                <td>
                    <c:out value="${role.description}"/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
   </table>

</div>

</body>

</html>