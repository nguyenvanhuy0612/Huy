package com.insight.common_func_collection;

public class Utility {

    /**
     * @param exception
     * @param object
     * @param <T>
     * @throws T
     */
    @SuppressWarnings("unchecked")
    private static <T extends Throwable> void throwException(Throwable exception, Object object) throws T {
        throw (T) exception;
    }

    public static void throwException(Throwable exception) {
        Utility.throwException(exception, null);
    }

    /**
     * @param sec
     */
    public static void wait(int sec) {
        try {
            Thread.sleep(sec * 1000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    /**
     * @param sec
     */
    public static void wait(float sec) {
        try {
            Thread.sleep((long) (sec * 1000));
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    /**
     * @param mSec
     */
    public static void wait(double mSec) {
        try {
            Thread.sleep((long) mSec);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
