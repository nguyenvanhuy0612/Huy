package com.huy.practice.learn;

public class GenericJava<K, V> {
    private K key;
    private V value;

    public GenericJava(K key, V value) {
        this.key = key;
        this.value = value;
    }

    public GenericJava(){

    }

    public void print(){
        System.out.printf("{%s : %s}\n", key, value);
    }

    public K getKey() {
        return key;
    }

    public void setKey(K key) {
        this.key = key;
    }

    public V getValue() {
        return value;
    }

    public void setValue(V value) {
        this.value = value;
    }
}