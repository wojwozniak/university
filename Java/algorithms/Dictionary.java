package algorithms;

public interface Dictionary<T extends Comparable<T>> { 
    boolean search(T x);
    void insert(T x);
    void remove(T x);
    T min();
    T max();
}