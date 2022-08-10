package com.codingdojo.repositories;

import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.models.Flavor;

@Repository
public interface FlavorRepository extends CrudRepository<Flavor, Long>{

	public ArrayList<Flavor> findAll();
}
