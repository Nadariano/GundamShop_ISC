/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import db.Product;
import db.ProductFacade;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PHT
 */
@WebServlet(name = "HomeController", urlPatterns = {"/home"})
public class HomeController extends HttpServlet {

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
            case "index":
                //Processing code here
                try {
                    ProductFacade pf = new ProductFacade();
                    List<Product> listHighest1 = pf.top3HighestEachType("SD");
                    List<Product> listHighest2 = pf.top3HighestEachType("HG");
                    List<Product> listHighest3 = pf.top3HighestEachType("RG");
                    List<Product> listHighest4 = pf.top3HighestEachType("MG");
                    List<Product> listLowest1 = pf.top3LowestEachType("SD");
                    List<Product> listLowest2 = pf.top3LowestEachType("HG");
                    List<Product> listLowest3 = pf.top3LowestEachType("RG");
                    List<Product> listLowest4 = pf.top3LowestEachType("MG");
                    request.setAttribute("listHighest1", listHighest1);
                    request.setAttribute("listHighest2", listHighest2);
                    request.setAttribute("listHighest3", listHighest3);
                    request.setAttribute("listHighest4", listHighest4);
                    request.setAttribute("listLowest1", listLowest1);
                    request.setAttribute("listLowest2", listLowest2);
                    request.setAttribute("listLowest3", listLowest3);
                    request.setAttribute("listLowest4", listLowest4);
                } catch (SQLException ex) {
                    ex.printStackTrace();//In thông báo chi tiết cho developer
                    request.setAttribute("message", ex.getMessage());
                    request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                }
                //Forward request & response to the main layout
                request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                break;
            case "contact":
                //Processing code here
                //Forward request & response to the main layout
                request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                break;
            case "legal_notice":
                //Processing code here
                //Forward request & response to the main layout
                request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                break;
            case "tac":
                //Processing code here
                //Forward request & response to the main layout
                request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
                break;
            case "faq":
                //Processing code here
                //Forward request & response to the main layout
                request.getRequestDispatcher("/layouts/main.jsp").forward(request, response);
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
