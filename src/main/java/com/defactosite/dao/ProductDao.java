package com.defactosite.dao;

import com.defactosite.entity.Product;

import java.util.List;

/**
 * Created by equinoxmohit on 2/15/17.
 */
public interface ProductDao {

    void insert(Product product);

    List<Product> getAllProduct();

    void delete(int id);

    Product getById(int id);


}
