// Test case for JCC

package org.jcc.test;

public class Test_parameter_order {

    public String constructor_name;

    public Test_parameter_order(){
        this.constructor_name = "None";
    }

    public Test_parameter_order(Animal foo){
        this.constructor_name = "Animal";
    }

    public Test_parameter_order(Feline foo){
        this.constructor_name = "Feline";
    }

    public Test_parameter_order(Snake foo){
        this.constructor_name = "Snake";
    }

    public Test_parameter_order(Cat foo){
        this.constructor_name = "Cat";
    }

    public Test_parameter_order(Mammal foo){
        this.constructor_name = "Mammal";
    }

    public Feline getNewOne(Feline foo){
            return new Feline();
            }

    public Snake getNewOne(Snake foo){
            return new Snake();
            }

    public Animal getNewOne(Animal foo){
            return new Animal();
            }


      public Cat getNewOne(Cat foo){
            return new Cat();
            }

      public Mammal getNewOne(Mammal foo){
            return new Mammal();
            }

       public Mammal getNewOne(Mammal foo, Mammal boo){
            return new Mammal();
            }

        public Animal getNewOne(Animal foo, Animal boo){
            return new Animal();
            }

           public Cat getNewOne(Cat foo, Cat boo){
            return new Cat();
            }

         public Feline getNewOne(Feline foo, Feline boo){
            return new Feline();
            }

            public Snake getNewOne(Snake foo, Snake boo){
            return new Snake();
            }

         public Mammal getNewOne(Animal foo, Cat boo){
            return new Mammal();
            }
}
