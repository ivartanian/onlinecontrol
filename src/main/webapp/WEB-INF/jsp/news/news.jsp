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

    <spring:url value="/webjars/jquery/2.1.3/jquery.js" var="jQuery"/>
    <script src="${jQuery}"></script>

    <jsp:include page="../fragments/datatablesLib.jsp"/>

    <script>
        $(document).ready(function() {
            var table = $('#news').DataTable();
        } );
    </script>

</head>
<body>
<div>

    <h2>Список новостей</h2>

    <table id="news" class="display compact" cellspacing="0" width="100%">
        <thead>
        <tr>
            <th>Дата</th>
            <th>Описание новости</th>
            <th>Редактировать новость</th>
            <th>Удалить</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="news" items="${news}">
            <tr>
                <td>
                    <fmt:formatDate pattern="dd.MM.yy" value="${news.date}"/>
                </td>
                <td>
                    <c:out value="${news.topic}"/>
                </td>
                <td>
                    <a href='<spring:url value="/news/${news.id}/edit" htmlEscape="true"/>' role="button">Редактировать новость</a></p>
                </td>
                <td>
                    <spring:url value="/news/${news.id}/delete" htmlEscape="true" var="action"/>
                    <form:form method="delete" action="${action}">
                        <p class="submit"><input type="submit" value="Удалить новость"/></p>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form:form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

</body>

</html>