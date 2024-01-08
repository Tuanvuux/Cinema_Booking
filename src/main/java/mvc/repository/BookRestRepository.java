package mvc.repository;

import mvc.entity.BookRestEntity;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;

@Repository
public class BookRestRepository {
    private List<BookRestEntity> bookRestEntityList = new ArrayList<>();

    @PostConstruct
    public void init(){
        bookRestEntityList.add(new BookRestEntity(1, "Java A-Z", 13.2, "Roger"));
        bookRestEntityList.add(new BookRestEntity(2, ".Net tutorial", 23.9, "Peter"));
    }

    public List<BookRestEntity> findAll(){
        return bookRestEntityList;
    }

    //add
    public  BookRestEntity save(BookRestEntity bookRestEntity){
        bookRestEntityList.add(bookRestEntity);
        return bookRestEntity;
    }

    //update
    public BookRestEntity update(BookRestEntity newBookRestData){
        boolean isFound = false;
        BookRestEntity foundBookRest = null;

        for(BookRestEntity bookRest: bookRestEntityList){
            if(bookRest.getId() == newBookRestData.getId()){
                isFound = true;
                foundBookRest = bookRest;
                break;
            }
        }
        if (!isFound){
            return null;
        }

        bookRestEntityList.remove(foundBookRest);
        newBookRestData.setId((foundBookRest.getId()));
        bookRestEntityList.add(newBookRestData);
        return  newBookRestData;
    }

    //delete
    public boolean delete(int bookRestID){
        boolean isFound = false;
        BookRestEntity foundBookRest = null;

        for(BookRestEntity bookRest: bookRestEntityList){
            if(bookRest.getId() == bookRestID){
                isFound = true;
                foundBookRest = bookRest;
                break;
            }
        }
        if (!isFound){
            return false;
        }

        bookRestEntityList.remove(foundBookRest);
        return true;
    }
}
