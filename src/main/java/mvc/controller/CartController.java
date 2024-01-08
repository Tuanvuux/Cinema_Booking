package mvc.controller;

import mvc.entity.OrderDetailsEntity;
import mvc.entity.OrderEntity;
import mvc.entity.ProductEntity;
import mvc.model.CartSession;
import mvc.model.Customer;
import mvc.repository.OrderDetailsRepository;
import mvc.repository.OrderRepository;
import mvc.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/")
public class CartController {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    OrderRepository orderRepository;
    @Autowired
    OrderDetailsRepository orderDetailsRepository;


    @GetMapping("/add/{productId}")
    public String addToCart(@PathVariable int productId, HttpSession session) {
        ProductEntity productEntity = productRepository.findById(productId).orElse(null);
        if (productEntity != null) {
            // Lấy thông tin giỏ hàng từ session
            // Get data from session
//            List<CartSession> cartList = (List<CartSession>) request.getSession().getAttribute("cartList");
            List<CartSession> cartList = (List<CartSession>) session.getAttribute("cartList");
            if (cartList == null) {
                cartList = new ArrayList<>();
            }

            // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
            boolean exists = false;
            for (CartSession cartItem : cartList) {
                if (cartItem.getProductEntity().getProductId() == productId) {
                    cartItem.setQuantity(cartItem.getQuantity() + 1);
                    exists = true;
                    break;
                }
            }
            if (!exists) {
                // Nếu sản phẩm chưa có trong giỏ hàng, thêm sản phẩm mới
                CartSession newCartItem = new CartSession(productEntity, 1);
                cartList.add(newCartItem);
            }

            // Cập nhật giỏ hàng trong session
            session.setAttribute("cartList", cartList);
        }
        return "order/Cart";
    }

    @GetMapping("/remove")
    public String removeFromCart(@RequestParam int productId, HttpSession session) {
        List<CartSession> cartList = (List<CartSession>) session.getAttribute("cartList");
        if (cartList != null) {
//            cartList.removeIf(cartItem -> cartItem.getProductEntity().getProductId() == productId);
            for(CartSession cartSession:cartList){
                if(cartSession.getProductEntity().getProductId()==productId){
                    cartList.remove(cartSession);
                }
            }
            session.setAttribute("cartList", cartList);
        }
        return "order/Cart"; // Điều hướng người dùng đến trang giỏ hàng
    }


    @GetMapping("/myCart")
    public String viewCart(HttpSession session, Model model) {
        List<CartSession> cartList = (List<CartSession>) session.getAttribute("cartList");
        model.addAttribute("cartList", cartList);
        return "order/Cart";
    }

    @GetMapping("/checkout")
    public String checkout(HttpSession session, Model model){
        model.addAttribute("customer", new Customer());
        return "order/Checkout";
    }

    @PostMapping("/Checkout")
    public String saveOrder(HttpSession session, Customer customer, Model model) {
        // luu vao bang order
        OrderEntity orders = new OrderEntity();
        orders.setOrderDate(LocalDate.now());
        orders.setCustomerName(customer.getCustomerName());
        orders.setCustomerAddress(customer.getCustomerAddress());
        orderRepository.save(orders);
        //luu vao order detail


        //order detail lay data tu session

        List<CartSession> cartSessionList =(List<CartSession>) session.getAttribute("cartList");
        for(CartSession cartSession: cartSessionList){
            OrderDetailsEntity orderdetails = new OrderDetailsEntity();
            orderdetails.setOrder(orders);
            orderdetails.setProduct(cartSession.getProductEntity());
            orderdetails.setQuantity(cartSession.getQuantity());
            orderDetailsRepository.save(orderdetails);

        }
        // saU KHI LUU XONG ORDER THI XOA SESSION
        session.removeAttribute("cartList");
        //con order lay tu man hinh(name vs address)

        return "redirect:/myOrder";
    }

    @GetMapping("/myOrder")
    public String myOrder(HttpSession session, Model model) {
        List<OrderEntity> ordersList = orderRepository.findAll();
        model.addAttribute("ordersList",ordersList);
        return "order/myOrder";
    }

    @GetMapping("/viewOrderDetails/{orderId}")
    public String viewOrderDetails(@PathVariable("orderId") int orderId, Model model) {
        OrderEntity orders = orderRepository.findById(orderId).get();
        List<OrderDetailsEntity> orderdetailsList = orders.getOrderDetails();
        model.addAttribute("orderdetailsList",orderdetailsList);
        return "order/OrderDetails"; // Điều hướng người dùng đến trang giỏ hàng
    }

}

