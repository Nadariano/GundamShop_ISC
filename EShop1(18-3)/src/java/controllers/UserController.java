/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import db.User;
import db.UserFacade;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author acer
 */
@WebServlet(name = "UserController", urlPatterns = {"/user"})
public class UserController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String controller = (String) request.getAttribute("controller");
        String action = (String) request.getAttribute("action");
        switch (action) {
            case "login":
                //Hien login form
                //Forward request & response to the main layout
                request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                break;
            case "login_handler":
                //Xu ly login form
                login_handler(request, response);
                //Forward request & response to the main layout
                //request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            case "register": {
                request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                break;
            }
            case "register_handler": {
                register_handler(request, response);
                break;
            }
            case "forgetpass": {
                request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                break;
            }
            case "forgetpass_handler": {
                forgetpass_handler(request, response);
                break;
            }
            case "logout": {
                logout(request, response);
                break;
            }

            case "info":
//                HttpSession session = request.getSession();
//                User user = (User) session.getAttribute("User");
//                session.setAttribute("User", user);
                request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                break;

            case "updateUser": {
                request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                break;
            }

            case "updateUser_handler": {
                updateUser_handler(request, response);
                break;
            }

            default:
            //Show error page
        }
    }

    protected void login_handler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        switch (op) {
            case "login":
                try {
                    String email = request.getParameter("email");
                    String password = request.getParameter("accountPass");
                    String remember = request.getParameter("remember");
                    UserFacade uf = new UserFacade();
                    User user = uf.login(email, password);
                    if (user != null) {
                        //Neu login thanh cong:
                        //Luu user vao session
                        HttpSession session = request.getSession();
                        session.setAttribute("User", user);
//                        if (remember != null && remember.equals("on")) {
//
//                            Cookie usernameCookie = new Cookie("password", password);
//                            usernameCookie.setMaxAge(60 * 60 * 24 * 15); // 30 days
//                            response.addCookie(usernameCookie);
//
//                        }
                        //quay ve home page
                        response.sendRedirect(request.getContextPath() + "/home/index.do");
                    } else {
                        //Cho hien lai login form
                        request.setAttribute("error", "Sai thông tin đăng nhập. Vui lòng kiểm tra lại!");
                        request.getRequestDispatcher("/user/login.do").forward(request, response);
                    }
                } catch (Exception ex) {
                    //Cho hien lai login form
                    request.setAttribute("error", ex.toString());
                    request.getRequestDispatcher("/user/login.do").forward(request, response);
                }

                break;
            case "cancel":
                //quay ve home page
                response.sendRedirect(request.getContextPath() + "/home/index.do");
                break;
        }
    }

    private void register_handler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        switch (op) {
            case "register":
                try {
//            boolean check = false;
                    String email = request.getParameter("email");
                    String accountpass = request.getParameter("accountPass");
                    String re_pass = request.getParameter("re_pass");
                    String accountname = request.getParameter("accountName");
                    String accountphone = request.getParameter("accountPhone");
                    String accountaddress = request.getParameter("accountAddress");
                    UserFacade uf = new UserFacade();
                    User user = uf.checkEmail(email);
                    if (email.isEmpty() || accountpass.isEmpty() || accountname.isEmpty() || accountphone.isEmpty() || accountaddress.isEmpty()) {
                        request.setAttribute("error", "Vui lòng điền đầy đủ thông tin!");
                        request.getRequestDispatcher("/user/register.do").forward(request, response);
                    } else {

                        if (user != null) {
//                    check = true;
                            request.setAttribute("error", "Email này đã được đăng ký!");
                            request.getRequestDispatcher("/user/register.do").forward(request, response);
                        } else {
                            if (!accountpass.equals(re_pass)) {
                                request.setAttribute("error", "Mật khẩu không trùng khớp!");
                                request.getRequestDispatcher("/user/register.do").forward(request, response);
                            } else {
                                User newUser = uf.register(email, accountpass, accountname, accountphone, accountaddress);
                                HttpSession session = request.getSession();
                                session.setAttribute("User", newUser);
                                request.setAttribute("message", "Đăng ký thành công! Vui lòng đăng nhập để tiếp tục thao tác.");
                                request.getRequestDispatcher("/user/login.do").forward(request, response);
                            }
                        }
                    }
                } catch (Exception e) {
                    request.setAttribute("error", e.toString());
                    request.getRequestDispatcher("/user/register.do").forward(request, response);
                }
                break;

        }
    }

    protected void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Xoa session
        HttpSession session = request.getSession();
        session.invalidate();
        //Quay ve home page
        response.sendRedirect(request.getContextPath() + "/home/index.do");
    }

    private void forgetpass_handler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String op = request.getParameter("op");
            UserFacade uf = new UserFacade();
            User user = new User();
            HttpSession session = request.getSession();
            switch (op) {
                case "forgetpass":
                    try {
                        String email = request.getParameter("email");
                        String phone = request.getParameter("accountPhone");
                        user = uf.forgetpass(email, phone);
                        if (user != null) {
                            session.setAttribute("User1", user);
                            request.setAttribute("message2", user.getAccountName());
                            request.getRequestDispatcher("/user/forgetpass.do").forward(request, response);
                        } else {
                            //Cho hien lai login form
                            request.setAttribute("message1", "Email hoặc số điện thoại không trùng khớp! Vui lòng thử lại!");
                            request.getRequestDispatcher("/user/forgetpass.do").forward(request, response);
                        }
                    } catch (Exception e) {
                        request.setAttribute("message1", e.toString());
                        request.getRequestDispatcher("/user/forgetpass.do").forward(request, response);

                    }
                    break;
                case "changepassword":
                    try {
                        user = (User) session.getAttribute("User1");
                        String accountpass = request.getParameter("accountPass");
                        String re_pass = request.getParameter("re_pass");
                        if (!accountpass.equals(re_pass)) {
                            session.setAttribute("User1", user);
                            request.setAttribute("message2", user.getAccountName());
                            request.setAttribute("message1", "Mật khẩu không trùng khớp!");
                            request.getRequestDispatcher("/user/forgetpass.do").forward(request, response);
                        } else {
                            user = uf.changepassword(accountpass, user.getEmail());
                            request.setAttribute("message", "Đổi mật khẩu thành công!vui lòng đăng nhập lại");
                            request.getRequestDispatcher("/user/login.do").forward(request, response);
                        }
                    } catch (Exception e) {
                    }
                    break;
            }
        } catch (Exception e) {
        }
    }

    protected void updateUser_handler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        switch (op) {
            case "update":
                try {
//            boolean check = false;
                    int accountId = Integer.parseInt(request.getParameter("accountId"));
                    String email = request.getParameter("email");
                    String accountpass = request.getParameter("accountPass");
                    String re_pass = request.getParameter("re_pass");
                    String accountname = request.getParameter("accountName");
                    String accountphone = request.getParameter("accountPhone");
                    String accountaddress = request.getParameter("accountAddress");
                    UserFacade uf = new UserFacade();
                    if (email.isEmpty() || accountpass.isEmpty() || accountname.isEmpty() || accountphone.isEmpty() || accountaddress.isEmpty()) {
                        request.setAttribute("error", "Vui lòng điền đầy đủ thông tin!");
                        request.getRequestDispatcher("/user/updateUser.do").forward(request, response);
                    } else {
                        if (!accountpass.equals(re_pass)) {
                            request.setAttribute("error", "Mật khẩu không trùng khớp!");
                            request.getRequestDispatcher("/user/updateUser.do").forward(request, response);
                        } else {
                            User user = new User(accountId, email, accountpass, accountname, accountphone, accountaddress);
                            uf.update(user);
                            HttpSession session = request.getSession();
                            session.setAttribute("User", user);
                            request.setAttribute("message", "Cập nhật thành công");
                            request.getRequestDispatcher("/user/info.do").forward(request, response);
                        }
                    }

                } catch (Exception e) {
                    request.setAttribute("error", e.toString());
                    request.getRequestDispatcher("/user/updateUser.do").forward(request, response);
                }
                break;
            case "cancel": {
                response.sendRedirect(request.getContextPath() + "/user/info.do");
                break;
            }

        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
