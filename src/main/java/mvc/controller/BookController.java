package mvc.controller;

import mvc.entity.BookEntity;
import mvc.entity.CategoryEntity;
import mvc.repository.BookCategory;
import mvc.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping(value = "/book")
public class BookController {
    @Autowired
    BookCategory bookCategory;

    @Autowired
    CategoryRepository categoryRepository;

    @RequestMapping(method = GET)
    public String showBook(Model model){
        List<BookEntity> bookList = (List<BookEntity>) bookCategory.findAll();
        model.addAttribute("bookList", bookList);
        return "book/home";
    }

    @RequestMapping(value = "/search", method = GET)
    public String search(@RequestParam("searchInput") String searchInput, Model model){
        List<BookEntity> resultList;
        if(searchInput.isEmpty()){
            resultList = (List<BookEntity>) bookCategory.findAll();
        } else {
            resultList = bookCategory.findByNameOrAuthor(searchInput, searchInput);
        }
        model.addAttribute("bookList", resultList);
        return "book/home";
    }

    @RequestMapping(value = "/newBook", method = GET)
    public String showNewBook(Model model){
        model.addAttribute("book", new BookEntity());
        model.addAttribute("msg", "Add a new book");
        model.addAttribute("action", "newBook");

        setCategoryDropDownList(model);
        return "book/book";
    }



    //bean validate
    @RequestMapping(value = "/newBook", method = POST, produces = "text/plain;charset=UTF-8")
    public String save(@Valid @ModelAttribute("book") BookEntity book,
                       BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            setCategoryDropDownList(model);
            return "book/book";
        }
        bookCategory.save(book);
        //model.addAttribute("book",book);
        return "redirect:/";
    }

    @RequestMapping(value = "/edit/{id}", method = GET)
    public String showEditBook(Model model, @PathVariable int id){
        BookEntity book = bookCategory.findById(id).get();
        model.addAttribute("book", book);
        model.addAttribute("msg", "update book information");
        model.addAttribute("type", "update");
        model.addAttribute("action", "/updateBook");

        setCategoryDropDownList(model);
        return "book/book";
    }

    @RequestMapping(value = "/updateBook", method = POST)
    public String updateBook(@ModelAttribute BookEntity book){
        bookCategory.save(book);
        return "redirect:/";
    }

    @RequestMapping(value = "/delete/{id}", method = GET)
    public String deleteBook(@PathVariable int id){
//        bookCategory.delete(id);
        bookCategory.deleteById(id);
        return "redirect:/";
    }

    @InitBinder
    public void initBinder(WebDataBinder binder){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

    private void setCategoryDropDownList(Model model){
        List<CategoryEntity> cateList = (List<CategoryEntity>) categoryRepository.findAll();
        if(!cateList.isEmpty()){
            Map<Integer,String> cateMap = new LinkedHashMap<>();
            for(CategoryEntity categoryEntity : cateList){
                cateMap.put(categoryEntity.getId(), categoryEntity.getName());
            }
            model.addAttribute("categoryList", cateMap);
        }
    }


}
