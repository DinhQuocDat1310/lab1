/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datdq.servlet;

import datdq.daos.ProductDAO;
import datdq.dtos.ProductDTO;
import datdq.dtos.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Asus
 */
@WebServlet(name = "LoadPageSearchServlet", urlPatterns = {"/LoadPageSearchServlet"})
public class LoadPageSearchServlet extends HttpServlet {

    private final String SEARCH_PAGE = "searchFood.jsp";

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
        PrintWriter out = response.getWriter();
        String pageIndex = request.getParameter("pageIndex");
        int index = 0;
        int pageSize = 4;
        int endPage = 0;
        boolean isAdmin = false;
        HttpSession session = request.getSession();
        UserDTO dto = (UserDTO) session.getAttribute("USER_LOGIN");
        if (dto != null) {
            isAdmin = dto.isIsAdmin();
        }
        try {
            if (pageIndex != null) {
                index = Integer.parseInt(pageIndex);
            }
            ProductDAO dao = new ProductDAO();
            dao.loadPage(index, pageSize, isAdmin);
            int count = dao.countResultSearchAll(isAdmin);
            endPage = count / pageSize;
            if (count % pageSize != 0) {
                endPage++;
            }
            List<ProductDTO> list = dao.getList();
            request.setAttribute("LIST_RESULT", list);
            request.setAttribute("ACTIONFORM", "LoadPageSearchServlet");
            request.setAttribute("ENDPAGE", endPage);
        } catch (NamingException ex) {
            Logger.getLogger(LoadPageSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LoadPageSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(SEARCH_PAGE);
            rd.forward(request, response);
            out.close();
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
