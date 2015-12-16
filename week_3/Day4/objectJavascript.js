// class Animal
//   def initialize (name, noise)

function Animal (name, noise) {
  // @name = name
  this.name = name;

  // @noise = noise
  this.noise = noise;
}

// def make_noise
Animal.prototype.makeNoise = function () {
  // puts @noise + "!!!!"
  console.log(this.noise + "!!!!");
};


// hamster = Animal.new("Anastasia", "Shhhhhh")
var hamster = new Animal("Anastasia", "Shhhhhh");

hamster.makeNoise();

// codeMonkey = Animal.new("Randy", "1738")
var codeMonkey = new Animal("Randy", "1738");

codeMonkey.makeNoise();

console.log("CODE MONKEY: " + codeMonkey.name);
