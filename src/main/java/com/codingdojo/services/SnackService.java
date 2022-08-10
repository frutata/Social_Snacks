package com.codingdojo.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.models.Snack;
import com.codingdojo.repositories.SnackRepository;

@Service
public class SnackService {

	@Autowired
	private SnackRepository snackRepository;
	
	public void createSnack(Snack snack) {
		snackRepository.save(snack);
	}
	
	public void updateSnack(Snack snack) {
		snackRepository.save(snack);
	}
	
	public ArrayList<Snack> findAll(){
		return snackRepository.findAll();
	}
	
	public Snack findById(Long id) {
		return snackRepository.findById(id).orElse(null);
	}
	
	public void deleteById(Long id) {
		snackRepository.deleteById(id);
	}
}
