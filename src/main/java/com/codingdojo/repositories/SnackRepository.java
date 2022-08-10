package com.codingdojo.repositories;

import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.models.Snack;

@Repository
public interface SnackRepository extends CrudRepository<Snack, Long>{

	public ArrayList<Snack> findAll();
}
