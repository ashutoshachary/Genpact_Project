<%@ page import="dao.UserDAO"%>
<%@ page import="java.util.Objects"%>
<header>
    <div class="fixed-top d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
        <h3 class="my-0 mr-md-auto font-weight-normal">Social</h3>
        <nav class="my-2 my-md-0 mr-md-3">
            <a class="p-2 text-dark" href="${pageContext.request.contextPath}/home">Home</a>
            <a class="p-2 text-dark" href="${pageContext.request.contextPath}/profile">Profile</a>
            <a class="p-2 text-dark" href="${pageContext.request.contextPath}/message">Message</a>
        </nav>
        <div style="width: 110px; text-align: center;">
            <% 
                Object userIdObject = session.getAttribute("user_id");
                if (userIdObject != null) {
                    int userId = ((Integer) userIdObject).intValue();
                    String userImage = new UserDAO().getUserById(userId).getImage();
            %>
            <img style="border-radius: 100%; height: 60px; width: 60px;" src="<%= userImage %>" />
            <% } %>
        </div>
        <div>
            <div class="row">
                <% 
                    
                    if (userIdObject != null) {
                        int userId = ((Integer) userIdObject).intValue();
                        String firstName = new UserDAO().getUserById(userId).getFirst_name();
                        String lastName = new UserDAO().getUserById(userId).getLast_name();
                %>
                <p style="text-align: center; width: 100%; margin-bottom: 2px;"><%= firstName + " " + lastName %></p>
                <a style="width: 100%;" class="btn btn-outline-primary" href="${pageContext.request.contextPath}/logout">logout</a>
                <% } %>
            </div>
        </div>
    </div>
</header>
