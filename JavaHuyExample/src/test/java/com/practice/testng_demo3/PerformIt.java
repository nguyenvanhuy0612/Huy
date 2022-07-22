package com.practice.testng_demo3;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface PerformIt {
    String value() default "";
    boolean enabled() default true;
    long timeOut() default 0;
    int priority() default 0;
}
