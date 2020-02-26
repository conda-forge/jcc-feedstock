package org.jcc.test;

public class Cat extends Feline implements Being {
    public void printName() {
        System.out.println("Cat");
    }

    public int getJavaFeets()
    {
        return this.getFeets();
    }

}