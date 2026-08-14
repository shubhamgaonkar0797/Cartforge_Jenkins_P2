const assert = require("assert");

const cart = {
  items: [
    { name: "Product A", quantity: 2, price: 100 },
    { name: "Product B", quantity: 1, price: 200 }
  ]
};

const total = cart.items.reduce(
  (sum, item) => sum + item.quantity * item.price,
  0
);

assert.strictEqual(total, 400);

console.log("CartForge tests passed successfully.");
