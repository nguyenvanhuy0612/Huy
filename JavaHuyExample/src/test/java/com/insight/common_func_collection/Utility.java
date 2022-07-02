package com.insight.common_func_collection;

public class Utility {

    @SuppressWarnings("unchecked")
    private static <T extends Throwable> void throwException(Throwable exception, Object object) throws T
    {
        throw (T) exception;
    }

    public static void throwException(Throwable exception)
    {
        Utility.throwException(exception, null);
    }
}
