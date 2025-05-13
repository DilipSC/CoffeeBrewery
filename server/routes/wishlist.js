const express = require('express');
const Wishlist = require('../models/Wishlist');
const authenticate = require('../middleware/authMiddleware');
const router = express.Router();


router.post('/add', authenticate, async (req, res) => {
  const item = await Wishlist.create({ ...req.body, userId: req.user.id });
  res.json(item);
});


router.get('/', authenticate, async (req, res) => {
  const items = await Wishlist.find({ userId: req.user.id });
  res.json(items);
});


router.delete('/:id', authenticate, async (req, res) => {
  await Wishlist.findByIdAndDelete(req.params.id);
  res.json({ message: 'Removed' });
});

module.exports = router;
