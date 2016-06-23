<jsp:include page="includes/header.jsp"/>
        <%
            if(session!=null && session.getAttribute("login")!=null){
                %>  
                
            <%}
            else{
                response.sendRedirect("login.jsp");
            }
        %>
        <jsp:include page="includes/footer.jsp" />
 
