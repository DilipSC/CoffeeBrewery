const express = require('express');
const Cart = require('../models/Cart');
const authenticate = require('../middleware/authMiddleware');
const router = express.Router();


router.get('/', authenticate, async (req, res) => {
  const cart = await Cart.findOne({ userId: req.user.id });
  res.json(cart || { userId: req.user.id, items: [] });
});


router.post('/add', authenticate, async (req, res) => {
  const { coffeeId, coffeeName, size, quantity, price } = req.body;
  let cart = await Cart.findOne({ userId: req.user.id });

  if (!cart) {
    cart = new Cart({ userId: req.user.id, items: [] });
  }

  const existing = cart.items.find(i => i.coffeeId === coffeeId && i.size === size);
  if (existing) {
    existing.quantity += quantity;
  } else {
    cart.items.push({ coffeeId, coffeeName, size, quantity, price });
  }

  cart.updatedAt = new Date();
  await cart.save();
  res.json(cart);
});


router.delete('/remove/:coffeeId', authenticate, async (req, res) => {
  const cart = await Cart.findOne({ userId: req.user.id });
  if (!cart) return res.status(404).json({ error: 'Cart not found' });

  cart.items = cart.items.filter(i => i.coffeeId !== req.params.coffeeId);
  await cart.save();
  res.json(cart);
});

module.exports = router;
