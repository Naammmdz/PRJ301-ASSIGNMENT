<%-- 
    Document   : lst
    Created on : Mar 7, 2025, 10:31:09 PM
    Author     : Naammm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <%
            String showForm = (String) session.getAttribute("showForm");
            String showLogin = (String) session.getAttribute("showLogin");
            session.removeAttribute("showForm");
            session.removeAttribute("showLogin");
        %>
        <%  if ("true".equals(showForm)) {
                if ("true".equals(showLogin)) { %> 
                    <div class="modal signup-login open">
                        <div class="modal-container active">
            <%
                }else{ %>
                    <div class="modal signup-login open">
                        <div class="modal-container">
            <%
                }
            %>
        <%
            }else{ %>
                <div class="modal signup-login">
                    <div class="modal-container">
        <%
           }
        %>
                <button class="form-close" onclick="closeModal()"><i class="fa-regular fa-xmark"></i></button>
                <div class="forms mdl-cnt">
                    <div class="form-content sign-up">
                        <h3 class="form-title">
                            Đăng kí tài khoản
                        </h3>
                        <p class="form-description">Đăng kí thành viên để mua hàng và nhận ưu đãi độc quyền từ chúng tôi</p>
                        <% 
                                String errorFullname = (String) session.getAttribute("errorFullname")+"";
                                String errorPhone = (String) session.getAttribute("errorPhone")+"";
                                String errorPassword = (String) session.getAttribute("errorPassword")+"";
                                String errorPasswordConf = (String) session.getAttribute("errorPasswordConf")+"";
                                String signFullname = (String) session.getAttribute("signFullname")+"";
                                String signPassword = (String) session.getAttribute("signPassword")+"";
                                String signPhone = (String) session.getAttribute("signPhone")+"";
                                
                                session.removeAttribute("errorFullname");
                                session.removeAttribute("errorPhone");
                                session.removeAttribute("errorPassword");
                                session.removeAttribute("errorPasswordConf");
                                session.removeAttribute("signFullname");
                                session.removeAttribute("signPassword");
                                session.removeAttribute("signPhone");
                        %>
                        <form action="MainController" class="signup-form" method="post">
                            <input type="hidden" name="action" value="signup" />
                            <div class="form-group">
                                <label for="fullname" class="form-label">Tên đầy đủ</label>
                                <input type="text" id="fullname" name="fullnameSign" placeholder="VD: Bành Thị Lú" class="form-control"  value="<%= signFullname.equals("null")?"":signFullname%>" required>
                                <span class="form-message-password-confi form-message"><%= errorFullname.equals("null")?"":errorFullname%></span>
                            </div>
                            <div class="form-group">
                                <label for="phone" class="form-label">Số điện thoại</label>
                                <input type="text" id="phone" name="phoneSign" placeholder="Nhập số điện thoại" class="form-control" value="<%= signPhone.equals("null")?"":signPhone%>" required>
                                <span class="form-message-password-confi form-message"><%= errorPhone.equals("null")?"":errorPhone%></span>
                            </div>
                            <div class="form-group">
                                <label for="password" class="form-label">Mật khẩu</label>
                                <input type="password" id="password" name="passwordSign" placeholder="Nhập mật khẩu" class="form-control" value="<%= signPassword.equals("null")?"":signPassword%>" required>
                                <span class="form-message-password-confi form-message"><%= errorPassword.equals("null")?"":errorPassword%></span>
                            </div>
                            <div class="form-group">
                                <label for="password_confirmation" class="form-label">Nhập lại mật khẩu</label>
                                <input type="password" id="password_confirmation" name="password_confirmationSign" 
                                    placeholder="Nhập lại mật khẩu" class="form-control" value="" required>
                                <span class="form-message-password-confi form-message"><%= errorPasswordConf.equals("null")?"":errorPasswordConf%></span>
                            </div>                    
<!--                            <div class="form-group">
                                <input type="checkbox" id="checkbox-signup" name="checkbox" required="">
                                <label for="checkbox-signup" class="form-checkbox"><a href="#"
                                        target="_blank">Tôi đồng ý với chính sách cửa hàng</a></label>
                                <p class="form-message-checkbox form-message"></p>
                            </div>-->
                            <button class="form-submit" id="signup-button">Đăng kí</button>
                        </form>
                        <p class="change-login">Bạn đã có tài khoản? <a href="javascript:;" class="login-link">Đăng nhập</a></p>
                    </div>
                    <div class="form-content login">
                        <h3 class="form-title">
                            Đăng nhập tài khoản
                        </h3>
                        <p class="form-description">Đăng nhập để mua hàng và nhận ưu đãi mới nhất</p>
                        <% 
                            String userPhone = (String) session.getAttribute("userPhone")+"";
                            userPhone= userPhone.equals("null")?"":userPhone; 
                            session.removeAttribute("userPhone");
                        %>
                        <form action="MainController" class="login-form" method="post">
                            <input type="hidden" name="action" value="login" />
                            <div class="form-group">
                                <label for="phone" class="form-label">Số điện thoại</label>
                                <input type="text" id="phone-login" name="phone" placeholder="Nhập số điện thoại" class="form-control" value="<%=userPhone%>" required>
                            </div>
                            <div class="form-group">
                                <label for="password" class="form-label">Mật khẩu</label>
                                <input type="password" id="password-login" name="password" placeholder="Nhập mật khẩu" class="form-control" required>
                                <span class="form-message-check-login form-message"></span>
                            </div>
                            <button class="form-submit" id="login-button">Đăng nhập</button>
                        </form>
                        <p class="change-login">Bạn chưa có tài khoản? <a href="javascript:;" class="signup-link">Đăng kí</a></p>
                    </div>
                </div>
            </div>
        </div>
        <% 
            String message = (String) session.getAttribute("toastMessage");
            String type = (String) session.getAttribute("toastType");
            session.removeAttribute("toastMessage");
            session.removeAttribute("toastType");

            if (message != null && type != null) {
                String icon = "";
                String color = "";

                switch (type) {
                    case "success":
                        icon = "fa-light fa-check";
                        color = "#47d864";
                        break;
                    case "info":
                        icon = "fa-solid fa-circle-info";
                        color = "#2f86eb";
                        break;
                    case "warning":
                        icon = "fa-solid fa-triangle-exclamation";
                        color = "#ffc021";
                        break;
                    case "error":
                        icon = "fa-solid fa-bug";
                        color = "#ff6243";
                        break;
                }
        %>
            <div id="toast">
                <div class="toast toast--<%=type%>" 
                     style="animation: slideInLeft ease 0.3s, fadeOut linear 1s 3s forwards">
                    <div class="toast__private">
                        <div class="toast__icon">
                            <i class="<%=icon%>"></i>
                        </div>
                        <div class="toast__body">
                            <h3 class="toast__title"><%= type.substring(0, 1).toUpperCase() + type.substring(1) %></h3>
                            <p class="toast__msg"><%= message %></p>
                        </div>
                        <div class="toast__close">
                            <i class="fa-regular fa-circle-xmark"></i>
                        </div>
                    </div>
                    <div class="toast__background" style="background-color: <%= color %>;">
                    </div>
                </div>
            </div>
        <%
            }
        %>
