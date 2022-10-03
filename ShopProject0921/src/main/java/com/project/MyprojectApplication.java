package com.project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;

@SpringBootApplication
public class MyprojectApplication {
	
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(MyprojectApplication.class);
	}
	public static void main(String[] args) {
		SpringApplication.run(MyprojectApplication.class, args);
	}

}
