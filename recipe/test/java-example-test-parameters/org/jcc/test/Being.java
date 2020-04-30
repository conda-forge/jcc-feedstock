package org.jcc.test;


interface Being {
    public void printName();

    default int getFeets()
    {
        return 4;
    }

    default int getFeetsWithOverride()
    {
        return 4;
    }

}