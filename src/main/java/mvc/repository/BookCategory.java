package mvc.repository;


import mvc.entity.BookEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface BookCategory extends CrudRepository<BookEntity, Integer> {
    List<BookEntity> findByAuthor(String author);
    List<BookEntity> findByNameAndAuthor(String name, String author);
    List<BookEntity> findByNameOrAuthor(String name, String author);
    List<BookEntity> findByBookDetailsIsbn(String isbn);
    List<BookEntity> findByBookDetailsPriceLessThan(int price);
    List<BookEntity> findByBookDetailsPriceLessThanEqual(int price);
    List<BookEntity> findByBookDetailsPriceGreaterThanEqual(int price);
    List<BookEntity> findByNameContaining(String name);
    @Query("select b from BookEntity b where b.name like ?1%")
    List<BookEntity> findBookNameStartWith(String name);
    @Query("select b from BookEntity b where b.bookDetails.price > ?1")
    List<BookEntity> findBookPriceGreaterThan(int price);
}
