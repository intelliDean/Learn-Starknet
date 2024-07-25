
//when cairo talks about methods, this is what they are emulating
//something like a class
//the struct fields represent the instance variables
//the trait represent interface in java
//the impl represents the implemention of the interfaces

class Name {

    private String name;
    private int age;

    public void introduction() {
        System.out.printf("My name is %s and I am %d years old", name, age);
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Integer getAge() {
        return age;
    }

    public static void main(String[] args) {
        Name name = new Name();
        name.setName("Michael Dean");
        name.setAge(12);

        System.out.printf("My name is %s%n and I am %d years old", name.getName(), name.getAge());
    }
}
// cd into the file that contains the java file
// to compile: javac Name.java
// to run the bytecode: java Name



The image below shows the code examples for Cairo and Java respectively, and the two codes accomplish the same task.
