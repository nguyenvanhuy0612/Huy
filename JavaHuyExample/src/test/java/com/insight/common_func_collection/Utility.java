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

    public static void wait(int sec) {
        try {
            Thread.sleep(sec * 1000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void wait(double sec) {
        try {
            Thread.sleep((long) (sec * 1000));
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
