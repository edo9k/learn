
// simple class
class Car {
  engine:string;

  constructor(engine:string) {
    this.engine = engine
  }

  disp():void {
    console.log(`Function displays Engine is: ${this.engine}`)
  }
}

const car = new Car("XYZ123")

console.log(`Car engine name from field: ${car.engine}`)

// car engine name from calling object method
car.disp()


// inheritance 

class Shape {
  area:number

  constructor(a:number) {
    this.area = a
  }
}

class Circle extends Shape {
  disp():void {
    console.log(`Area of the circle: ${this.area}`)
  }
}

const circle = new Circle(42)
circle.disp()

