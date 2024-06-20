<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Skill Test Questions</title>
</head>
<body>
    <h1>Skill Test for Job: ${job.title}</h1>
    

    <c:if test="${not empty questions}">
        <div>
            <h3>Questions:</h3>
            <c:forEach var="question" items="${questions}">
                <div>
                    <p>Question: ${question.content}</p>
                    <p>Asked on: <fmt:formatDate value="${question.date}" pattern="dd-MM-yyyy" /></p>
                    <ul>
                        <c:forEach var="answer" items="${questionAnswersMap[question]}">
                            <li>${answer.answerText}</li>
                        </c:forEach>
                    </ul>
                </div>
            </c:forEach>
        </div>
    </c:if>
</body>
</html>
