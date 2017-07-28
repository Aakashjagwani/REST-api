<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    <div class="panel panel-primary">
    <div class="panel-heading">
        <h2 class="panel-title">Results</h2>
    </div>
    <div class="panel-body">
<table class="table table-responsive table-striped table-condensed table-hover">
<tr class="success"><th>Index</th><th>FileName</th><th>Category</th></tr>
<%long index=1;%>
<c:forEach items="${sessionScope.list}" var="item">
<tr><td><%=index%></td><td>${item.file}</td><td>${item.cat}</td></tr>
<%index+=1;%>
  </c:forEach>
</table>

</div>
</div>