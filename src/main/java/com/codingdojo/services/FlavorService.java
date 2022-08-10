package com.codingdojo.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.models.Flavor;
import com.codingdojo.repositories.FlavorRepository;

@Service
public class FlavorService {

	@Autowired
	private FlavorRepository flavorRepository;
	
	public ArrayList<Flavor> findAll(){
		return flavorRepository.findAll();
	}
	
	public Flavor findById(Long id) {
		return flavorRepository.findById(id).orElse(null);
	}
}
