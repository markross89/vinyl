package com.vinyl.validator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;


@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = StrongPasswordValidator.class)
@Documented
public @interface StrongPassword {
	
	String message () default "{javax.validation.constraints.StrongPassword.message}";
	
	Class<?>[] groups () default {};
	
	Class<? extends Payload>[] payload () default {};
}