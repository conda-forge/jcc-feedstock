// Test case for JCC

public class Test_parameter_order {

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
