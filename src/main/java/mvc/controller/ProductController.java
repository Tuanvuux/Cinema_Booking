package mvc.controller;

import mvc.entity.ProductEntity;
import mvc.repository.OrderRepository;
import mvc.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    OrderRepository orderRepository;

    @RequestMapping(method = GET)
    public String showProducts(Model model){
        List<ProductEntity> productEntityList = (List<ProductEntity>) productRepository.findAll();
        System.out.println(productEntityList.size());
        model.addAttribute("productList", productEntityList);

        return "order/ProductList";
    }

}
