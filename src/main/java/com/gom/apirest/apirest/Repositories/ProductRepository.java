package com.gom.apirest.apirest.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gom.apirest.apirest.Entities.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {

}
