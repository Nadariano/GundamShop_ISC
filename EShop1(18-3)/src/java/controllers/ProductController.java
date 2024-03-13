/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.sun.java.swing.plaf.windows.resources.windows;
import com.vnpay.common.Config;
import db.Cart;
import db.Discount;
import db.DiscountFacade;
import db.Item;
import db.Order;
import db.OrderDetail;
import db.OrderFacade;
import db.Product;
import db.ProductFacade;
import db.User;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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
@WebServlet(name = "ProductController", urlPatterns = {"/product"})
public class ProductController extends HttpServlet {

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
        switch (action) {
            case "product_details":
                try {
                    //Đọc mẫu tin cần sửa vào đối tượng toy
                    String product_id = request.getParameter("productId");
                    Product product = pf.read(product_id);
                    //Lưu toy vào request để truyền cho view edit.jsp
                    request.setAttribute("product", product);
                    //Chuyển request & response đến view edit.jsp để xử lý tiếp
                    request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                } catch (SQLException ex) {
                    //Hien trang thong bao loi
                    ex.printStackTrace();//in thong bao loi chi tiet cho developer
                    request.setAttribute("message", ex.getMessage());
                    request.setAttribute("controller", "error");
                    request.setAttribute("action", "error");
                    request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                }
                break;
            case "product_summary":
                //Processing code here
                //Forward request & response to the main layout
                try {
                    String op = request.getParameter("op");
                    switch (op) {
                        case "list": {
                            pf = new ProductFacade();
                            request.setAttribute("pf", pf);
                            //Quay ve cart page
                            request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                        }
                        break;
                        case "add": {
                            String product_id = request.getParameter("product_id");
                            Product product = pf.read(product_id);
                            Item item = new Item(product, 1);
                            //Lấy giỏ hàng từ session ra
                            Cart cart = (Cart) session.getAttribute("cart");
                            if (cart == null) {
                                //Nếu chưa có giỏ hàng thì tạo giỏ hàng mới
                                cart = new Cart();
                                session.setAttribute("cart", cart);
                            }
                            // Add item vào giỏ hàng
                            cart.add(item);
                            //request.getRequestDispatcher("/product/products.do?op=productAll").forward(request, response);
                            request.getRequestDispatcher("/product/products.do?op=productAll").forward(request, response);
                        }
                        break;
                        case "increase": {
                            int quantity = Integer.parseInt(request.getParameter("quantity"));
                            String product_id = request.getParameter("product_id");
                            Product product = pf.read(product_id);
                            Item item = new Item(product, quantity + 1);//Moi lan add 1 san pham
                            //Lay gio hang tu session
                            Cart cart = (Cart) session.getAttribute("cart");
                            //Add item into cart
                            cart.update(product_id, quantity + 1);
                            //request.getRequestDispatcher("/product/products.do?op=productAll").forward(request, response);
                            request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                        }
                        break;
                        case "decrease": {
                            String product_id = request.getParameter("product_id");
                            int quantity = Integer.parseInt(request.getParameter("quantity"));
                            if (quantity > 1) {
                                Product product = pf.read(product_id);
                                Item item = new Item(product, quantity - 1);//Moi lan add 1 san pham
                                //Lay gio hang tu session
                                Cart cart = (Cart) session.getAttribute("cart");
                                //Add item into cart
                                cart.update(product_id, quantity - 1);
                            }
                            //request.getRequestDispatcher("/product/products.do?op=productAll").forward(request, response);
                            request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                        }
                        break;
                        case "delete": {
                            String product_id = request.getParameter("product_id");
                            //Lấy giỏ hàng từ session ra
                            Cart cart = (Cart) session.getAttribute("cart");
                            // Remove item vào giỏ hàng
                            cart.remove(product_id);
                            request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                        }
                        break;
                        case "empty": {
                            Cart cart = (Cart) session.getAttribute("cart");
                            cart.empty();
                            session.setAttribute("discount", null);
                            request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                            break;
                        }
                        case "update": {
                            String product_id = request.getParameter("product_id");
                            int quantity = Integer.parseInt(request.getParameter("quantity"));
                            if (quantity > 0) {
                                Cart cart = (Cart) session.getAttribute("cart");
                                cart.update(product_id, quantity);
                            }
                            request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                        }
                        break;
                        case "discount":
                            try {
                                User user = (User) session.getAttribute("User");
                                //Đọc mẫu tin cần sửa vào đối tượng toy
                                if (user == null) {
                                    request.setAttribute("messaged", "Voucher chỉ có hiẹu lực khi bạn đăng nhập!");
                                } else {
                                    String discountId = request.getParameter("discountId");
                                    DiscountFacade df = new DiscountFacade();
                                    Discount discount = df.readVoucher(discountId);
                                    if (discount == null) {
                                        request.setAttribute("messaged", "Mã giảm giá không tồn tại!");

                                    } else {
                                        session.setAttribute("discount", discount);
                                    }
                                }
                                request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                                //Chuyển request & response đến view edit.jsp để xử lý tiếp
                            } catch (SQLException ex) {
                                ex.printStackTrace();
                                request.setAttribute("message", ex.getMessage());
                                request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                            }
                            break;
                    }
                } catch (Exception ex) {
                    //Hien trang thong bao loi
                    ex.printStackTrace();//In thông báo chi tiết cho developer
                    request.setAttribute("message", ex.getMessage());
                    request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                }
                break;
            case "billing":
                try {
                    String op = request.getParameter("op");
                    switch (op) {
                        case "print": {
                            User user = (User) session.getAttribute("User");
                            if (user == null) {
                                request.getRequestDispatcher("/user/login.do").forward(request, response);
                            } else {
                                request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                            }
                            break;
                        }

                        case "checkout": {
                            Cart cart = (Cart) session.getAttribute("cart");
                            User user = (User) session.getAttribute("User");
                            String order_note = request.getParameter("order_note");
                            String paymentMethod = request.getParameter("paymentMethod");
                            Discount discount = (Discount) session.getAttribute("discount");
                            if (user == null) {
                                request.getRequestDispatcher("/user/login.do").forward(request, response);
                            } else {
                                OrderFacade of = new OrderFacade();
                                int discountRate = 0;
                                if (discount != null) {
                                    discountRate = discount.getDiscountRate();
                                }
                                int order_id = of.addOrder(user, cart, order_note, paymentMethod, discountRate);
                                cart.empty();
                                Order order = of.read(order_id);
                                List<OrderDetail> odList;
                                odList = of.readAllProducts(order_id);
                                session.setAttribute("discount", null);
                                session.setAttribute("orderId", order_id);
                                session.setAttribute("order", order);
                                session.setAttribute("odList", odList);
                                session.setAttribute("message", "Đơn hàng của bạn đã được xử lý!");
//                                request.getRequestDispatcher("/product/transaction_success.do").forward(request, response);
                                String vnp_Version = "2.0.0";
                                String vnp_Command = "pay";
                                String vnp_TxnRef = Config.getRandomNumber(8);
                                String vnp_OrderInfo = "Thanh toan don hang " + vnp_TxnRef;
                                String orderType = "billpayment";
                                String vnp_IpAddr = Config.getIpAddress(request);
                                String vnp_TmnCode = Config.vnp_TmnCode;

                                int amount = (int) (Math.round(order.getTotalMoney()) * 25000);
                                Map<String, String> vnp_Params = new HashMap<>();
//                                vnp_Params.put("vnp_message", "Đơn hàng của bạn đã được xử lý!");

                                vnp_Params.put("vnp_Version", vnp_Version);
                                vnp_Params.put("vnp_Command", vnp_Command);
                                vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
                                vnp_Params.put("vnp_Amount", String.valueOf(amount));
                                vnp_Params.put("vnp_CurrCode", "VND");
                                String bank_code = "";
                                if (bank_code != null && bank_code.isEmpty()) {
                                    vnp_Params.put("vnp_BankCode", bank_code);
                                }
                                vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
                                vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
                                vnp_Params.put("vnp_OrderType", orderType);

                                String locate = "vi";
                                if (locate != null && !locate.isEmpty()) {
                                    vnp_Params.put("vnp_Locale", locate);
                                } else {
                                    vnp_Params.put("vnp_Locale", "vn");
                                }
                                vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
                                vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

                                Date dt = new Date();
                                SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                                String dateString = formatter.format(dt);
                                String vnp_CreateDate = dateString;
                                String vnp_TransDate = vnp_CreateDate;
                                vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

                                //Build data to hash and querystring
                                List fieldNames = new ArrayList(vnp_Params.keySet());
                                Collections.sort(fieldNames);
                                StringBuilder hashData = new StringBuilder();
                                StringBuilder query = new StringBuilder();
                                Iterator itr = fieldNames.iterator();
                                while (itr.hasNext()) {
                                    String fieldName = (String) itr.next();
                                    String fieldValue = (String) vnp_Params.get(fieldName);
                                    if ((fieldValue != null) && (fieldValue.length() > 0)) {
                                        //Build hash data
                                        hashData.append(fieldName);
                                        hashData.append('=');
                                        hashData.append(fieldValue);
                                        //Build query
                                        query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                                        query.append('=');
                                        query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                                        if (itr.hasNext()) {
                                            query.append('&');
                                            hashData.append('&');
                                        }
                                    }
                                }
//                                Collections.sort(fieldNames);
//                                StringBuilder hashData = new StringBuilder();
//                                StringBuilder query = new StringBuilder();
//                                Iterator itr = fieldNames.iterator();
//                                while (itr.hasNext()) {
//                                    String fieldName = (String) itr.next();
//                                    String fieldValue = (String) vnp_Params.get(fieldName);
//                                    if ((fieldValue != null) && (fieldValue.length() > 0)) {
//                                        //Build hash data
//                                        hashData.append(fieldName);
//                                        hashData.append('=');
//                                        hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
//                                        //Build query
//                                        query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
//                                        query.append('=');
//                                        query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
//                                        if (itr.hasNext()) {
//                                            query.append('&');
//                                            hashData.append('&');
//                                        }
//                                    }
//                                }
                                String queryUrl = query.toString();
                                String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
                                queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
                                String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
                                request.setAttribute("code", "00");
                                request.setAttribute("message", "success");
                                request.setAttribute("data", paymentUrl);
                                response.sendRedirect(paymentUrl);
                            }

                        }
                        break;
                        case "cancel": {
                            response.sendRedirect(request.getContextPath() + "/product/product_summary.do?op=list");
                            break;
                        }

                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                    request.setAttribute("message", ex.getMessage());
                    request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                }
                break;

            //!!Trang thong bao mua hang thanh cong
            case "transaction_success":
                request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                session.removeAttribute("orderId");
                session.removeAttribute("order");
                session.removeAttribute("odList");
                session.removeAttribute("message");
                break;

            case "products":
                try {
                    List<Product> list = (List<Product>) session.getAttribute("list");
                    List<Product> sortedList, sortedSubList;
                    int page = 1;
                    int recordsPerPage = 6;
                    if (request.getParameter("page") != null) {
                        page = Integer.parseInt(request.getParameter("page"));
                    }
                    int startIndex = (page - 1) * recordsPerPage + 1;
                    int endIndex = recordsPerPage * page;
                    String op = request.getParameter("op");
                    String subOp;
                    String oldOp = (String) session.getAttribute("op");
                    session.getAttribute("subOp");
                    switch (op) {
                        case "productAll":
                            list = pf.select(startIndex, endIndex);
                            request.setAttribute("list", list);
                            request.setAttribute("type_id", "Mọi thể loại");
                            request.setAttribute("total", pf.getTotal());
                            session.setAttribute("total", pf.getTotal());
                            session.setAttribute("type_id", "Mọi thể loại");
                            break;
                        case "productByType":
                            String type_id = request.getParameter("type_id");
                            list = pf.getAllProductsByTypeId(type_id, startIndex, endIndex);
                            request.setAttribute("list", list);
                            request.setAttribute("type_id", type_id);
                            int totalByType_id = pf.totalByTypeID(type_id);
                            request.setAttribute("total", totalByType_id);
                            session.setAttribute("total", totalByType_id);
                            session.setAttribute("type_id", type_id);
                            break;
                        case "sort":
                            subOp = request.getParameter("subOp");
                            String oldType_id = (String) session.getAttribute("type_id");
                            String oldNamePart = (String) session.getAttribute("namePart");
                            if (oldOp.equals("productAll")) {
                                list = pf.select();
                            }
                            if (oldOp.equals("productByType")) {
                                list = pf.getAllProductsByTypeId(oldType_id);
                            }
                            if (oldOp.equals("search")) {
                                list = pf.search(oldNamePart);
                            }
                            switch (subOp) {
                                case "ascPrice":
                                    sortedList = pf.sortByPriceAsc(list);
                                    if (endIndex < list.size()) {
                                        sortedSubList = sortedList.subList(startIndex - 1, endIndex);
                                    } else {
                                        sortedSubList = sortedList.subList(startIndex - 1, list.size());
                                    }
                                    request.setAttribute("list", sortedSubList);
                                    request.setAttribute("subOpName", "Giá tăng dần");
                                    break;
                                case "descPrice":
                                    sortedList = pf.sortByPriceDesc(list);
                                    if (endIndex < list.size()) {
                                        sortedSubList = sortedList.subList(startIndex - 1, endIndex);
                                    } else {
                                        sortedSubList = sortedList.subList(startIndex - 1, list.size());
                                    }
                                    request.setAttribute("list", sortedSubList);
                                    request.setAttribute("subOpName", "Giá giảm dần");

                                    break;
                                default:
                                    sortedList = list;
                                    if (endIndex < list.size()) {
                                        sortedSubList = sortedList.subList(startIndex - 1, endIndex);
                                    } else {
                                        sortedSubList = sortedList.subList(startIndex - 1, list.size());
                                    }
                                    request.setAttribute("list", sortedSubList);
                                    request.setAttribute("subOpName", "Mặc định");
                                    break;
                            }
                            request.setAttribute("subOp", subOp);
                            session.setAttribute("subOp", subOp);
                            break;

                        case "search":
                            String namePart = request.getParameter("productName");
                            list = pf.search(namePart, startIndex, endIndex);
                            request.setAttribute("list", list);
                            int totalByName = pf.totalByName(namePart);
                            request.setAttribute("total", totalByName);
                            session.setAttribute("type_id", "Theo tên");
                            session.setAttribute("total", totalByName);
                            session.setAttribute("namePart", namePart);
                            break;
                    }
                    request.setAttribute("currentPage", page);
                    session.setAttribute("list", list);
                    session.setAttribute("op", op);
                    session.setAttribute("currentPage", page);

                    request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                } catch (SQLException ex) {
                    //Hien trang thong bao loi
                    ex.printStackTrace();//In thông báo chi tiết cho developer
                    request.setAttribute("message", ex.getMessage());
                    request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                }
                break;
            default:
            //Show error page
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
