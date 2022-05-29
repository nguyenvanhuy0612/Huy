package com.practice.huypractice;

public class Test1 {

    /**
     * Get length of a number
     *
     * @param d
     * @return
     */
    private int length(double d) {
        return String.valueOf((int) d).length();
    }

    /**
     * Repeat string
     *
     * @param s
     * @param count
     * @return
     */
    private String repeatString(String s, int count) {
        StringBuilder r = new StringBuilder();
        for (int i = 0; i < count; i++) {
            r.append(s);
        }
        return r.toString();
    }

    private String repeatStringJava11(String s, int c) {
        return s.repeat(c);
    }

    /**
     * Get java version
     *
     * @return
     */
    public static int getVersion() {
        String version = System.getProperty("java.version");
        if (version.startsWith("1.")) {
            version = version.substring(2, 3);
        } else {
            int dot = version.indexOf(".");
            if (dot != -1) {
                version = version.substring(0, dot);
            }
        }
        return Integer.parseInt(version);
    }
}
