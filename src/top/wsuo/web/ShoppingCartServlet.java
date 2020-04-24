package top.wsuo.web;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import top.wsuo.pojo.Product;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ShoppingCartServlet",
        urlPatterns = {
                "/shop/products",
                "/shop/details",
                "/shop/addCart",
                "/shop/deleteItem",
                "/shop/clearCart",
                "/shop/search"},
        loadOnStartup = 1)
public class ShoppingCartServlet extends HttpServlet {

    private static int count = 0;
//    private static ServletConfig config;
    /**
     * 数据的初始化
     *
     * @param config 配置参数,可以获取应用作用域
     * @throws ServletException 抛出异常
     */
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        // 装载数据
//        Product p1 = new Product
//                (1, "单反相机", "最没有性价比的单反相机", 3306f);
//        Product p2 = new Product
//                (2, "双反相机", "最不值的双反相机", 3307f);
//        Product p3 = new Product
//                (3, "三反相机", "最难看的三反相机", 3308f);
//        Product p4 = new Product
//                (4, "四反相机", "最花里胡哨的四反相机", 3309f);
//        List<Product> list = new ArrayList<>();
//        list.add(p1);
//        list.add(p2);
//        list.add(p3);
//        list.add(p4);
        // 保存到应用作用域中
//        config
//                .getServletContext()
//                .setAttribute("products", list);
        initProduct("java");
    }

    /**
     * 根据请求参数后缀来分别处理请求
     *
     * @param request  请求
     * @param response 响应
     * @throws ServletException Servlet异常
     * @throws IOException      IO异常
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.endsWith("products")) displayProducts(request, response);
        else if (uri.endsWith("details")) displayGoods(request, response);
        else if (uri.endsWith("addCart")) addCart(request, response);
        else if (uri.endsWith("deleteItem")) deleteCard(request, response);
        else if (uri.endsWith("clearCart")) clearCart(request, response);
        else if (uri.endsWith("search")) doSearch(request, response);
    }

    /**
     * 清空购物车
     * 响应请求: /shop/clearCart
     *
     * @param request  请求对象
     * @param response 响应对象
     */
    private void clearCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().removeAttribute("cart");
        response.sendRedirect("./cart.jsp");
    }

    /**
     * 浏览器入口
     *
     * @param request  请求
     * @param response 转发
     * @throws ServletException Servlet异常
     * @throws IOException      IO异常
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    /**
     * 用于跳转到商品展示页面
     * 响应请求: /shop/products
     * <p>
     * 注意: 只接受同级目录下的页面请求,所以 ./ 或者不写都可以
     *
     * @param request  请求
     * @param response 响应
     * @throws IOException IO异常
     */
    private void displayProducts(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("./productList.jsp");
    }

    /**
     * 根据 ID 查询用户点击的是哪一个商品,然后跳转到商品详情页面
     * 响应请求: /shop/details
     * <p>
     * 注意: 只接受同级目录下的页面请求,所以 ./ 或者不写都可以
     *
     * @param request  请求
     * @param response 响应
     * @throws ServletException Servlet 异常
     * @throws IOException      IO 异常
     */
    private void displayGoods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        List<Product> products = (List<Product>) getServletContext()
                .getAttribute("products");
        Product product = findById(id, products);
        if (product != null) request.setAttribute("product", product);
        request.getRequestDispatcher("./productDetails.jsp")
                .forward(request, response);
    }

    /**
     * 添加到购物车
     * 响应请求: /shop/addCart
     *
     * @param request  请求
     * @param response 响应
     * @throws IOException 异常
     */
    private void addCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ServletContext context = getServletContext();
        HttpSession session = request.getSession();
        Integer id = Integer.parseInt(request.getParameter("id"));
        Integer quality = Integer.parseInt(request.getParameter("quality"));
        List<Product> products = (List<Product>) context
                .getAttribute("products");
        // 初始化购物车
        Map<Product, Integer> cart = (Map<Product, Integer>) session
                .getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }
        Product product = findById(id, products);
        if (product != null) {
            cart.put(product, quality);
            session.setAttribute("cart", cart);
        }
        displayProducts(request, response);
    }

    /**
     * 删除商品
     * /shop/deleteItem
     *
     * @param request  请求
     * @param response 响应
     */
    private void deleteCard(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        ServletContext context = getServletContext();
        HttpSession session = request.getSession();
        List<Product> products = (List<Product>) context
                .getAttribute("products");
        Map<Product, Integer> cart = (HashMap) session
                .getAttribute("cart");

        Product product = findById(id, products);
        if (product != null) {
            cart.remove(product);
            session.setAttribute("cart", cart);
        }
        response.sendRedirect("./cart.jsp");
    }

    /**
     * 根据 id 查询相关内容是否在作用域中
     */
    private Product findById(Integer id, List<Product> products) {
        for (Product product : products) {
            if (id.equals(product.getId())) {
                return product;
            }
        }
        return null;
    }

    private void initProduct(String keyWords) {
        String url = "https://search.jd.com/Search?keyword=" + keyWords + "&enc=utf-8";
        List<Product> list = new ArrayList<>();
        try {
            Document parse = Jsoup.parse(new URL(url), 30000);
            Element element = parse.getElementById("J_goodsList");
            Elements li = element.getElementsByTag("li");
            for (Element el : li) {
                count++;
                String img = el.getElementsByTag("img").eq(0).attr("source-data-lazy-img");
                String price = el.getElementsByClass("p-price").eq(0).text();
                String title = el.getElementsByClass("p-name").eq(0).text();
                Product product =
                        new Product(count, title, img, Float.valueOf(price.split("￥")[1]));
                list.add(product);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        this
                .getServletContext()
                .setAttribute("products", list);
    }

    /**
     * 搜索功能
     * /shop/search
     *
     */
    private void doSearch(
            HttpServletRequest request,
            HttpServletResponse response) throws IOException {
        String keyWords = request.getParameter("keyword");
//        System.out.println("数据初始化");
//        this.getServletContext().removeAttribute("products");
        initProduct(keyWords);
//        System.out.println("转发到商品首页");
        displayProducts(request, response);
    }
}
