/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.HomeDao;
import DAO.ProductDao;
import Model.Shoes;
import Model.Shop;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author lathai
 */
public class ShopController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int page;
        int numberPerPage = 12;

        String pageChooes = req.getParameter("page");
        if (pageChooes == null) {
            page = 1;
        } else {
            page = Integer.parseInt(pageChooes);
        }

        int begin, end;
        begin = (page - 1) * numberPerPage;
        ProductDao pd = new ProductDao();
        ArrayList<Shoes> listShoes = new ArrayList<>();
        listShoes = pd.getListShoesNoDuplicate();
        end = Math.min(listShoes.size(), page * numberPerPage);

        ArrayList<Shoes> listShoesPerPage = new ArrayList<>();
        listShoesPerPage = pd.getListByPage(begin, end, listShoes);

        int numberOfPage = ((listShoes.size() % numberPerPage == 0) ? (listShoes.size() / numberPerPage) : (listShoes.size() / numberPerPage + 1));
        req.setAttribute("listShoesPerPage", listShoesPerPage);
        req.setAttribute("page", page);
        req.setAttribute("numberOfPage", numberOfPage);

        HomeDao hd = new HomeDao();
        Shop sh = new Shop();
        sh = hd.getShopInfo();
        req.setAttribute("shop", sh);
        
        req.getRequestDispatcher("Shop.jsp").forward(req, resp);
    }
}
