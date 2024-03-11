/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import db.Brand;
import db.BrandFacade;
import db.Product;
import db.ProductFacade;
import db.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
@WebServlet(name = "AdminController", urlPatterns = {"/admin"})
public class AdminController extends HttpServlet {

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
        ProductFacade pf = new ProductFacade();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("User");
        if (user == null || !user.isRoleId() == true) {
            session.invalidate();
            response.sendRedirect(request.getContextPath() + "/user/login.do");
            return;
        }
        switch (action) {
            case "create": {
                try {
                    //Đọc toàn bộ table brand
                    BrandFacade bf = new BrandFacade();
                    List<Brand> list = bf.select();
                    //Truyền list cho view để tạo combo box
                    request.setAttribute("list", list);
                    //foward đển main layouts
                    request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                } catch (Exception ex) {
                    request.setAttribute("message", ex.getMessage());
                    request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                }
            }
            break;
            case "create_handler": {
                String op = request.getParameter("op");
                switch (op) {
                    case "create":
                        try {
                            //B1: Đọc dữ liệu từ client gửi lên
                            String product_id = request.getParameter("product_id");
                            String productName = request.getParameter("productName");
                            String origin = request.getParameter("origin");
                            double price = Double.parseDouble(request.getParameter("price"));
                            String productDetails = request.getParameter("productDetails");
                            String productMatelrial = request.getParameter("productMaterial");
                            String type_id = request.getParameter("type_id");
                            int brand_id = Integer.parseInt(request.getParameter("brand_id"));
                            Product product = new Product(product_id, productName, origin, price, productDetails, productMatelrial, type_id, brand_id);
                            //Lưu Toy vào request để bảo toàn form
                            request.setAttribute("product", product);
                            BrandFacade bf = new BrandFacade();
                            List<Brand> list = bf.select();
                            //Truyền list cho view để tạo combo box
                            request.setAttribute("list", list);
                            pf.create(product);
                            response.sendRedirect(request.getContextPath() + "/home/index.do");
                        } catch (Exception ex) {
                            //Hiện lại create form để nhập lại dữ liệu
                            ex.printStackTrace();//In thông báo chi tiết cho developer
                            request.setAttribute("message", ex.getMessage());
                            request.setAttribute("action", "create");
                            request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                        }
                        break;
                    case "cancel":
                        response.sendRedirect(request.getContextPath() + "/product/products.do?op=productAll");
                        break;
                }
            }
            break;
            case "update": {
                try {
                    //Đọc mẫu tin cần sửa vào đối tượng toy
                    String product_id = request.getParameter("product_id");
                    Product product = pf.read1(product_id);
                    //Lưu toy vào request để truyền cho view edit.jsp
                    request.setAttribute("product", product);
                    //Chuyển request & response đến view edit.jsp để xử lí tiếp
                    request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                } catch (Exception ex) {
                    request.setAttribute("message", ex.getMessage());
                    request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                }
            }
            break;
            case "update_handler": {
                String op = request.getParameter("op");
                switch (op) {
                    case "update":
                        try {
                            //B1: Đọc dữ liệu từ client gửi lên
                            String product_id = request.getParameter("product_id");
                            String productName = request.getParameter("productName");
                            String origin = request.getParameter("origin");
                            double price = Double.parseDouble(request.getParameter("price"));
                            String productDetails = request.getParameter("productDetails");
                            String productMaterial = request.getParameter("productMaterial");
                            String type_id = request.getParameter("type_id");
                            int brand_id = Integer.parseInt(request.getParameter("brand_id"));
                            Product product = new Product(product_id, productName, origin, price, productDetails, productMaterial, type_id, brand_id);
                            pf.update(product);
                            response.sendRedirect(request.getContextPath() + "/home/index.do");
                        } catch (Exception ex) {
                            //Hiện trang thông báo lỗi
                            ex.printStackTrace();//In thông báo chi tiết cho developer
                            request.setAttribute("message", ex.getMessage());
                            request.setAttribute("controller", "error");
                            request.setAttribute("action", "error");
                            request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                        }
                        break;
                    case "cancel":
                        response.sendRedirect(request.getContextPath() + "/product/products.do?op=productAll");
                        break;
                }
            }
            break;
            case "delete": {
                try {
                    String product_id = request.getParameter("product_id");
                    pf.delete(product_id);
                    //foward đển main layouts
                    response.sendRedirect(request.getContextPath() + "/home/index.do");
//                    request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                } catch (Exception ex) {
                    request.setAttribute("message", ex.getMessage());
                    request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                }
            }
            break;

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
