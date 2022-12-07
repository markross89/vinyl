package com.marek.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Pattern;


public class StrongPasswordValidator implements ConstraintValidator<StrongPassword, String> {
	
	
	@Override
	public boolean isValid (String value, ConstraintValidatorContext context) {
		
		Pattern pattern = Pattern.compile("^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\\W).*$");
		return pattern.matcher(value).matches();
		
	}
	
	
}
